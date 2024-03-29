<?php

/**
 * @license LGPLv3, http://opensource.org/licenses/LGPL-3.0
 * @copyright Aimeos (aimeos.org), 2019
 * @package Controller
 * @subpackage Common
 */


namespace Aimeos\Controller\Common\Common\Import\Xml\Processor\Lists\Media;


/**
 * Media list processor for XML imports
 *
 * @package Controller
 * @subpackage Common
 */
class Standard
	extends \Aimeos\Controller\Common\Common\Import\Xml\Processor\Base
	implements \Aimeos\Controller\Common\Common\Import\Xml\Processor\Iface
{
	use \Aimeos\Controller\Common\Common\Import\Xml\Traits;


	/** controller/common/common/import/xml/processor/lists/media/name
	 * Name of the lists processor implementation
	 *
	 * Use "Myname" if your class is named "\Aimeos\Controller\Common\Common\Import\Xml\Processor\Lists\Media\Myname".
	 * The name is case-sensitive and you should avoid camel case names like "MyName".
	 *
	 * @param string Last part of the processor class name
	 * @since 2019.04
	 * @category Developer
	 */


	/**
	 * Updates the given item using the data from the DOM node
	 *
	 * @param \Aimeos\MShop\Common\Item\Iface $item Item which should be updated
	 * @param \DOMNode $node XML document node containing a list of nodes to process
	 * @return \Aimeos\MShop\Common\Item\Iface Updated item
	 */
	public function process( \Aimeos\MShop\Common\Item\Iface $item, \DOMNode $node )
	{
		\Aimeos\MW\Common\Base::checkClass( \Aimeos\MShop\Common\Item\ListRef\Iface::class, $item );

		$listItems = array_reverse( $item->getListItems( 'media', null, null, false ), true );
		$resource = $item->getResourceType();
		$context = $this->getContext();

		$listManager = \Aimeos\MShop::create( $context, $resource . '/lists' );
		$manager = \Aimeos\MShop::create( $context, 'media' );

		foreach( $node->childNodes as $refNode )
		{
			if( $refNode->nodeName !== 'mediaitem' ) {
				continue;
			}

			if( ( $listItem = array_pop( $listItems ) ) === null ) {
				$listItem = $listManager->createItem();
			}

			if( ( $refItem = $listItem->getRefItem() ) === null ) {
				$refItem = $manager->createItem();
			}

			$list = [];

			foreach( $refNode->childNodes as $tag )
			{
				if( in_array( $tag->nodeName, ['lists', 'property'] ) ) {
					$refItem = $this->getProcessor( $tag->nodeName )->process( $refItem, $tag );
				} else {
					$list[$tag->nodeName] = $tag->nodeValue;
				}
			}

			$refItem = $refItem->fromArray( $list );

			foreach( $refNode->attributes as $attrName => $attrNode ) {
				$list[$resource . '.' . $attrName] = $attrNode->nodeValue;
			}

			$name = $resource . '.lists.config';
			$list[$name] = ( isset( $list[$name] ) ? (array) json_decode( $list[$name] ) : [] );
			$name = $resource . '.lists.type';
			$list[$name] = ( isset( $list[$name] ) ? $list[$name] : 'default' );

			$this->addType( $resource . '/lists/type', 'media', $list[$resource . '.lists.type'] );

			$listItem = $listItem->fromArray( $list );
			$item->addListItem( 'media', $listItem, $refItem );
		}

		return $item->deleteListItems( $listItems );
	}
}
