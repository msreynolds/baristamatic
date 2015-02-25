package com.trustwave.baristamatic.event.message
{
	import flash.events.Event;
	
	import spark.formatters.CurrencyFormatter;
	
	public class BaseMessageEvent extends Event
	{
		protected var currencyFormatter:CurrencyFormatter;
		
		public function BaseMessageEvent(type:String)
		{
			currencyFormatter = new CurrencyFormatter();
			currencyFormatter.currencySymbol = '$';
			currencyFormatter.useCurrencySymbol = true;
			
			super(type);
		}
		
		// Override me
		public function getMessage():String
		{
			return '';
		}
	}
}