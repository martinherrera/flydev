<?php

/**
 * @license LGPLv3, http://opensource.org/licenses/LGPL-3.0
 * @copyright Aimeos (aimeos.org), 2015-2018
 * @package Controller
 * @subpackage Common
 */


namespace Aimeos\Controller\Common\Product\Import\Csv\Processor\Media;


/**
 * Media processor for CSV imports
 *
 * @package Controller
 * @subpackage Common
 */
class Standard
	extends \Aimeos\Controller\Common\Product\Import\Csv\Processor\Base
	implements \Aimeos\Controller\Common\Product\Import\Csv\Processor\Iface
{
	/** controller/common/product/import/csv/processor/media/name
	 * Name of the media processor implementation
	 *
	 * Use "Myname" if your class is named "\Aimeos\Controller\Common\Product\Import\Csv\Processor\Media\Myname".
	 * The name is case-sensitive and you should avoid camel case names like "MyName".
	 *
	 * @param string Last part of the processor class name
	 * @since 2015.10
	 * @category Developer
	 */

	private $listTypes;
	private $types = [];
	private $mimes = [];


	/**
	 * Initializes the object
	 *
	 * @param \Aimeos\MShop\Context\Item\Iface $context Context object
	 * @param array $mapping Associative list of field position in CSV as key and domain item key as value
	 * @param \Aimeos\Controller\Common\Product\Import\Csv\Processor\Iface $object Decorated processor
	 */
	public function __construct( \Aimeos\MShop\Context\Item\Iface $context, array $mapping,
			\Aimeos\Controller\Common\Product\Import\Csv\Processor\Iface $object = null )
	{
		parent::__construct( $context, $mapping, $object );

		$this->mimes = array_flip( $context->getConfig()->get( 'controller/common/media/standard/extensions', [] ) );

		/** controller/common/product/import/csv/processor/media/listtypes
		 * Names of the product list types for media that are updated or removed
		 *
		 * If you want to associate media items manually via the administration
		 * interface to products and don't want these to be touched during the
		 * import, you can specify the product list types for these media
		 * that shouldn't be updated or removed.
		 *
		 * @param array|null List of product list type names or null for all
		 * @since 2015.05
		 * @category Developer
		 * @category User
		 * @see controller/common/product/import/csv/domains
		 * @see controller/common/product/import/csv/processor/attribute/listtypes
		 * @see controller/common/product/import/csv/processor/catalog/listtypes
		 * @see controller/common/product/import/csv/processor/product/listtypes
		 * @see controller/common/product/import/csv/processor/price/listtypes
		 * @see controller/common/product/import/csv/processor/text/listtypes
		 */
		$key = 'controller/common/product/import/csv/processor/media/listtypes';
		$this->listTypes = $context->getConfig()->get( $key );

		if( $this->listTypes === null )
		{
			$this->listTypes = [];
			$manager = \Aimeos\MShop::create( $context, 'product/lists/type' );

			$search = $manager->createSearch()->setSlice( 0, 0x7fffffff );
			$search->setConditions( $search->compare( '==', 'product.lists.type.domain', 'media' ) );

			foreach( $manager->searchItems( $search ) as $item ) {
				$this->listTypes[$item->getCode()] = $item->getCode();
			}
		}
		else
		{
			$this->listTypes = array_flip( $this->listTypes );
		}


		$manager = \Aimeos\MShop::create( $context, 'media/type' );

		$search = $manager->createSearch()->setSlice( 0, 0x7fffffff );
		$search->setConditions( $search->compare( '==', 'media.type.domain', 'product' ) );

		foreach( $manager->searchItems( $search ) as $item ) {
			$this->types[$item->getCode()] = $item->getCode();
		}
	}


	/**
	 * Saves the product related data to the storage
	 *
	 * @param \Aimeos\MShop\Product\Item\Iface $product Product item with associated items
	 * @param array $data List of CSV fields with position as key and data as value
	 * @return array List of data which hasn't been imported
	 */
	public function process( \Aimeos\MShop\Product\Item\Iface $product, array $data )
	{
		$context = $this->getContext();
		$manager = \Aimeos\MShop::create( $context, 'media' );
		$listManager = \Aimeos\MShop::create( $context, 'product/lists' );
		$separator = $context->getConfig()->get( 'controller/common/product/import/csv/separator', "\n" );

		$listMap = [];
		$map = $this->getMappedChunk( $data, $this->getMapping() );
		$listItems = $product->getListItems( 'media', $this->listTypes );
		$cntl = \Aimeos\Controller\Common\Media\Factory::create( $context );

		foreach( $listItems as $listItem )
		{
			if( ( $refItem = $listItem->getRefItem() ) !== null ) {
				$listMap[$refItem->getUrl()][$refItem->getType()][$listItem->getType()] = $listItem;
			}
		}

		foreach( $map as $pos => $list )
		{
			if( $this->checkEntry( $list ) === false ) {
				continue;
			}

			$type = $this->getValue( $list, 'media.type', 'default' );
			$listtype = $this->getValue( $list, 'product.lists.type', 'default' );
			$urls = explode( $separator, $this->getValue( $list, 'media.url', '' ) );
			$preview = explode( $separator, $this->getValue( $list, 'media.preview', '' ) );
			$previews = explode( $separator, $this->getValue( $list, 'media.previews', '' ) );

			unset( $list['media.preview'], $list['media.previews'], $list['media.url'] );

			$this->addType( 'product/lists/type', 'media', $listtype );
			$this->addType( 'media/type', 'product', $type );

			foreach( $urls as $idx => $url )
			{
				$url = trim( $url );

				if( isset( $listMap[$url][$type][$listtype] ) )
				{
					$listItem = $listMap[$url][$type][$listtype];
					$refItem = $listItem->getRefItem();
					unset( $listItems[$listItem->getId()] );
				}
				else
				{
					$listItem = $listManager->createItem()->setType( $listtype );
					$refItem = $manager->createItem()->setType( $type );
				}

				$ext = pathinfo( $url, PATHINFO_EXTENSION );
				if( isset( $this->mimes[$ext] ) ) {
					$refItem->setMimeType( $this->mimes[$ext] );
				}

				$listItem = $listItem->setPosition( $pos++ )->fromArray( $list );
				$refItem = $refItem->setLabel( $url )->fromArray( $list )->setUrl( $url );

				try
				{
					if( isset( $previews[$idx] ) && ( $map = json_decode( $previews[$idx], true ) ) !== null ) {
						$refItem->setPreviews( $map );
					} elseif( isset( $preview[$idx] ) ) {
						$refItem->setPreview( $preview[$idx] );
					} elseif( $refItem->isModified() ) {
						$refItem = $cntl->scale( $refItem );
					}
				}
				catch( \Aimeos\MW\Media\Exception $e )
				{
					$context->getLogger()->log( sprintf( 'Scaling image "%1$s" failed: %2$s', $url, $e->getMessage() ) );
				}

				$product->addListItem( 'media', $listItem, $refItem );
			}
		}

		$product->deleteListItems( $listItems, true );

		return $this->getObject()->process( $product, $data );
	}


	/**
	 * Checks if an entry can be used for updating a media item
	 *
	 * @param array $list Associative list of key/value pairs from the mapping
	 * @return boolean True if valid, false if not
	 */
	protected function checkEntry( array $list )
	{
		if( $this->getValue( $list, 'media.url' ) === null ) {
			return false;
		}

		if( ( $type = $this->getValue( $list, 'product.lists.type' ) ) && !isset( $this->listTypes[$type] ) )
		{
			$msg = sprintf( 'Invalid type "%1$s" (%2$s)', $type, 'product list' );
			throw new \Aimeos\Controller\Common\Exception( $msg );
		}

		if( ( $type = $this->getValue( $list, 'media.type' ) ) && !isset( $this->types[$type] ) )
		{
			$msg = sprintf( 'Invalid type "%1$s" (%2$s)', $type, 'media' );
			throw new \Aimeos\Controller\Common\Exception( $msg );
		}

		return true;
	}
}
