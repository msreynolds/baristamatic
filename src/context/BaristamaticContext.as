package context
{
	import com.trustwave.baristamatic.command.app.BaristamaticInitializeCommand;
	import com.trustwave.baristamatic.command.user.InventoryRestockCommand;
	import com.trustwave.baristamatic.command.user.ProductOrderCommand;
	import com.trustwave.baristamatic.event.app.BaristamaticInitializeEvent;
	import com.trustwave.baristamatic.event.user.InventoryRestockEvent;
	import com.trustwave.baristamatic.event.user.ProductOrderEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.InventoryModel;
	import com.trustwave.baristamatic.model.ProductModel;
	import com.trustwave.baristamatic.view.BaristaMaticView;
	import com.trustwave.baristamatic.view.BaristaMaticViewMediator;
	import com.trustwave.baristamatic.view.InventoryListView;
	import com.trustwave.baristamatic.view.InventoryListViewMediator;
	import com.trustwave.baristamatic.view.ProductListView;
	import com.trustwave.baristamatic.view.ProductListViewMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.Context;
	
	public class BaristamaticContext extends Context
	{
		public function BaristamaticContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			// Event/Command mappings
			commandMap.mapEvent(BaristamaticInitializeEvent.TYPE, BaristamaticInitializeCommand, BaristamaticInitializeEvent);
			commandMap.mapEvent(ProductOrderEvent.TYPE, ProductOrderCommand, ProductOrderEvent);
			commandMap.mapEvent(InventoryRestockEvent.TYPE, InventoryRestockCommand, InventoryRestockEvent);

			// Mediator mappings
			mediatorMap.mapView(BaristaMaticView, BaristaMaticViewMediator);
			mediatorMap.mapView(ProductListView, ProductListViewMediator);
			mediatorMap.mapView(InventoryListView, InventoryListViewMediator);
			
			// Model mappings
			injector.mapSingletonOf(IProductModel, ProductModel);
			injector.mapSingletonOf(IInventoryModel, InventoryModel);
			
			super.startup();		
		}
		
		override public function shutdown():void
		{
			commandMap.unmapEvent(BaristamaticInitializeEvent.TYPE, BaristamaticInitializeCommand, BaristamaticInitializeEvent);
			commandMap.unmapEvent(ProductOrderEvent.TYPE, ProductOrderCommand, ProductOrderEvent);
			commandMap.unmapEvent(InventoryRestockEvent.TYPE, InventoryRestockCommand, InventoryRestockEvent);
			
			super.shutdown();
		}

	}
	
	
}