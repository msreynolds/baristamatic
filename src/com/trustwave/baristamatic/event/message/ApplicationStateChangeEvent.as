package com.trustwave.baristamatic.event.message
{
	import flash.events.Event;
	
	public class ApplicationStateChangeEvent extends Event
	{
		public static const TYPE:String = "ApplicationStateChangeEvent";
		
		private var _isOn:Boolean;
		
		public function ApplicationStateChangeEvent(isOn:Boolean)
		{
			_isOn = isOn;
			
			super(TYPE);
		}

		public function get isOn():Boolean
		{
			return _isOn;
		}
	}
}