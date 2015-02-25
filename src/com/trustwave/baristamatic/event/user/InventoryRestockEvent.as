package com.trustwave.baristamatic.event.user
{
	import flash.events.Event;
	
	public class InventoryRestockEvent extends Event
	{
		public static const TYPE:String = "ProductRestockEvent";
		
		public function InventoryRestockEvent()
		{
			super(TYPE);
		}
	}
}