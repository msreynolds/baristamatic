package com.trustwave.baristamatic.event.message
{
	
	public class ProductOrderConfirmMessageEvent extends BaseMessageEvent
	{
		public static const TYPE:String = "ProductOrderConfirmMessageEvent";
		
		private var _name:String;
		private var _cost:Number = 0;
		
		public function ProductOrderConfirmMessageEvent(name:String, cost:Number)
		{
			_name = name;
			_cost = cost;
			
			super(TYPE);
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get cost():Number
		{
			return _cost;
		}
		
		override public function getMessage():String
		{
			return "Enjoy your " + name + " for " + currencyFormatter.format(cost);
		}
	}
}