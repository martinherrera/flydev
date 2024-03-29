<?php

/**
 * @license LGPLv3, http://opensource.org/licenses/LGPL-3.0
 * @copyright Aimeos (aimeos.org), 2015-2018
 */


namespace Aimeos\Admin\JQAdm\Product\Stock;


class StandardTest extends \PHPUnit\Framework\TestCase
{
	private $context;
	private $object;
	private $view;


	protected function setUp()
	{
		$this->view = \TestHelperJqadm::getView();
		$this->context = \TestHelperJqadm::getContext();

		$this->object = new \Aimeos\Admin\JQAdm\Product\Stock\Standard( $this->context );
		$this->object = new \Aimeos\Admin\JQAdm\Common\Decorator\Page( $this->object, $this->context );
		$this->object->setAimeos( \TestHelperJqadm::getAimeos() );
		$this->object->setView( $this->view );
	}


	protected function tearDown()
	{
		unset( $this->object, $this->view, $this->context );
	}


	public function testCreate()
	{
		$manager = \Aimeos\MShop::create( $this->context, 'product' );

		$this->view->item = $manager->createItem();
		$result = $this->object->create();

		$this->assertNull( $this->view->get( 'errors' ) );
		$this->assertContains( 'item-stock', $result );
	}


	public function testCopy()
	{
		$manager = \Aimeos\MShop::create( $this->context, 'product' );

		$this->view->item = $manager->findItem( 'CNC' );
		$result = $this->object->copy();

		$this->assertNull( $this->view->get( 'errors' ) );
		$this->assertContains( '&quot;stock.stocklevel&quot;:&quot;1200&quot;', $result );
		$this->assertContains( '&quot;stock.dateback&quot;:&quot;2015-05-01T00:00:00&quot;', $result );
	}


	public function testGet()
	{
		$manager = \Aimeos\MShop::create( $this->context, 'product' );

		$this->view->item = $manager->findItem( 'CNC' );
		$result = $this->object->get();

		$this->assertNull( $this->view->get( 'errors' ) );
		$this->assertContains( '&quot;stock.stocklevel&quot;:&quot;1200&quot;', $result );
		$this->assertContains( '&quot;stock.dateback&quot;:&quot;2015-05-01T00:00:00&quot;', $result );
	}


	public function testSave()
	{
		$manager = \Aimeos\MShop::create( $this->context, 'product' );
		$stockManager = \Aimeos\MShop::create( $this->context, 'stock' );

		$item = $manager->findItem( 'CNC' );
		$item->setCode( 'jqadm-test-stock' );
		$item->setId( null );

		$item = $manager->saveItem( $item );


		$param = array(
			'site' => 'unittest',
			'stock' => [[
				'stock.id' => '',
				'stock.type' => 'default',
				'stock.dateback' => '2000-01-01 00:00:00',
				'stock.stocklevel' => '-1',
			]]
		);

		$helper = new \Aimeos\MW\View\Helper\Param\Standard( $this->view, $param );
		$this->view->addHelper( 'param', $helper );
		$this->view->item = $item->setCode( 'jqadm-test-stock-2' );

		$result = $this->object->save();

		$search = $stockManager->createSearch();
		$search->setConditions( $search->compare( '==', 'stock.productcode', 'jqadm-test-stock' ) );
		$count = count( $stockManager->searchItems( $search ) );

		$search = $stockManager->createSearch();
		$search->setConditions( $search->compare( '==', 'stock.productcode', 'jqadm-test-stock-2' ) );
		$stocks = $stockManager->searchItems( $search );

		$stockManager->deleteItems( array_keys( $stocks ) );
		$manager->deleteItem( $item->getId() );

		$this->assertNull( $this->view->get( 'errors' ) );
		$this->assertNull( $result );
		$this->assertEquals( 0, $count );
		$this->assertEquals( 1, count( $stocks ) );
	}


	public function testSaveException()
	{
		$object = $this->getMockBuilder( \Aimeos\Admin\JQAdm\Product\Stock\Standard::class )
			->setConstructorArgs( array( $this->context, \TestHelperJqadm::getTemplatePaths() ) )
			->setMethods( array( 'fromArray' ) )
			->getMock();

		$object->expects( $this->once() )->method( 'fromArray' )
			->will( $this->throwException( new \RuntimeException() ) );

		$this->view = \TestHelperJqadm::getView();
		$this->view->item = \Aimeos\MShop::create( $this->context, 'product' )->createItem();

		$object->setView( $this->view );

		$this->setExpectedException( \Aimeos\Admin\JQAdm\Exception::class );
		$object->save();
	}


	public function testSaveMShopException()
	{
		$object = $this->getMockBuilder( \Aimeos\Admin\JQAdm\Product\Stock\Standard::class )
			->setConstructorArgs( array( $this->context, \TestHelperJqadm::getTemplatePaths() ) )
			->setMethods( array( 'fromArray' ) )
			->getMock();

		$object->expects( $this->once() )->method( 'fromArray' )
			->will( $this->throwException( new \Aimeos\MShop\Exception() ) );

		$this->view = \TestHelperJqadm::getView();
		$this->view->item = \Aimeos\MShop::create( $this->context, 'product' )->createItem();

		$object->setView( $this->view );

		$this->setExpectedException( \Aimeos\Admin\JQAdm\Exception::class );
		$object->save();
	}


	public function testGetSubClient()
	{
		$this->setExpectedException( \Aimeos\Admin\JQAdm\Exception::class );
		$this->object->getSubClient( 'unknown' );
	}
}
