package com.trustwave.baristamatic.view
{
	import com.trustwave.baristamatic.event.message.ApplicationStateChangeEvent;
	import com.trustwave.baristamatic.event.user.ProductOrderEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.vo.ProductVO;
	import com.trustwave.baristamatic.view.renderer.ProductItemListItemRenderer;
	
	import flash.events.MouseEvent;
	
	import mx.core.ClassFactory;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class ProductListViewMediator extends Mediator
	{
		[Inject]
		public var view:ProductListView;
		
		[Inject]
		public var productModel:IProductModel;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		protected var isOn:Boolean;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			// View Actions
			view.listProducts.addEventListener(MouseEvent.CLICK, listProducts_clickHandler);
				
			// Messages
			addContextListener(ApplicationStateChangeEvent.TYPE, handleApplicationStateChangeEvent);
			
			// Models
			view.listProducts.dataProvider = productModel.allProducts;
			
			createRendererFactory();
		}
		
		override public function onRemove():void
		{
			super.onRemove();
		}
		
		protected function handleApplicationStateChangeEvent(event:ApplicationStateChangeEvent):void
		{
			isOn = event.isOn;
			view.listProducts.enabled = isOn;
			
			for each (var product:ProductVO in productModel.allProducts)
			{
				product.isOn = event.isOn;
			}
		}
		
		protected function createRendererFactory():void
		{
			var properties:Object = {inventoryModel: inventoryModel};
			var factory:ClassFactory = new ClassFactory(ProductItemListItemRenderer);
			factory.properties = properties;
			view.listProducts.itemRenderer = factory;
		}
		
		protected function listProducts_clickHandler(event:MouseEvent):void
		{
			if (isOn)
			{
				const selectedProduct:ProductVO = view.listProducts.selectedItem;
				
				// The click event can fire when scrolling (when no selection event has occured)
				// So make sure there is a selected Product
				if (selectedProduct)
				{
					dispatch( new ProductOrderEvent(selectedProduct) );
					
					view.listProducts.selectedItem = null;
				}
			}
		}
	}
}