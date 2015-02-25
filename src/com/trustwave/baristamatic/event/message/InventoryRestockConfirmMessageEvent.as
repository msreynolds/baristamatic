package com.trustwave.baristamatic.event.message
{
	public class InventoryRestockConfirmMessageEvent extends BaseMessageEvent
	{
		public static const TYPE:String = "InventoryRestockConfirmMessageEvent";
		
		public function InventoryRestockConfirmMessageEvent()
		{
			super(TYPE);
		}
		
		override public function getMessage():String
		{
			return "The Ingredient Inventory has been Restocked!";
		}
	}
}