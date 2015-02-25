package com.trustwave.baristamatic.view
{
	import com.trustwave.baristamatic.event.message.ApplicationStateChangeEvent;
	import com.trustwave.baristamatic.event.message.ProductOrderConfirmMessageEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	import com.trustwave.baristamatic.view.renderer.InventoryItemListItemRenderer;
	
	import mx.core.ClassFactory;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class InventoryListViewMediator extends Mediator
	{
		[Inject]
		public var view:InventoryListView;
		
		[Inject]
		public var productModel:IProductModel;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			// View Actions
			addContextListener(ApplicationStateChangeEvent.TYPE, handleApplicationStateChangeEvent);
			addContextListener(ProductOrderConfirmMessageEvent.TYPE, handleProductOrderConfirmationEvent);
			
			// Models
			view.listInventory.dataProvider = inventoryModel.allIngredients;
			
			// Init View
			createRendererFactory();
		}
		
		override public function onRemove():void
		{
			removeContextListener(ApplicationStateChangeEvent.TYPE, handleApplicationStateChangeEvent);
			
			super.onRemove();
		}
		
		protected function handleApplicationStateChangeEvent(event:ApplicationStateChangeEvent):void
		{
			for each (var ingredient:IngredientVO in inventoryModel.allIngredients)
			{
				ingredient.isOn = event.isOn;
			}
		}

		protected function handleProductOrderConfirmationEvent(event:ProductOrderConfirmMessageEvent):void
		{
			trace("Inventory Knows Product has been ordered!");
		}

		protected function createRendererFactory():void
		{
			var properties:Object = {inventoryModel: inventoryModel};
			var factory:ClassFactory = new ClassFactory(InventoryItemListItemRenderer);
			factory.properties = properties;
			view.listInventory.itemRenderer = factory;
		}
	}
}