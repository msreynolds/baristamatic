package com.trustwave.baristamatic.view
{
	import com.trustwave.baristamatic.event.app.BaristamaticInitializeEvent;
	import com.trustwave.baristamatic.event.message.ApplicationStateChangeEvent;
	import com.trustwave.baristamatic.event.message.BaseMessageEvent;
	import com.trustwave.baristamatic.event.message.ProductOrderConfirmMessageEvent;
	import com.trustwave.baristamatic.event.user.InventoryRestockEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class BaristaMaticViewMediator extends Mediator
	{
		[Inject]
		public var view:BaristaMaticView;
		
		[Inject]
		public var productModel:IProductModel;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		override public function onRegister():void
		{
			super.onRegister();
			
			// View Actions
			view.btnPower.addEventListener(MouseEvent.CLICK, btnPower_clickHandler, false, 0, true);
			view.btnRestock.addEventListener(MouseEvent.CLICK, btnRestock_clickHandler, false, 0, true);
			
			// Messages
			addContextListener(ProductOrderConfirmMessageEvent.TYPE, handleMessage, ProductOrderConfirmMessageEvent);

			dispatch( new BaristamaticInitializeEvent() );
		}
		
		override public function onRemove():void
		{
			super.onRemove();
		}
		
		protected function btnPower_clickHandler(event:MouseEvent):void
		{
			if (view.btnPower.selected)
			{
				view.currentState = "on";
			}
			else
			{
				view.currentState = "off";
			}
			
			dispatch( new ApplicationStateChangeEvent(view.btnPower.selected) );
		}
		
		protected function btnRestock_clickHandler(event:MouseEvent):void
		{
			dispatch( new InventoryRestockEvent() );	
		}
		
		protected function handleMessage(event:BaseMessageEvent):void
		{
			trace(event.getMessage());
		}
	}
}