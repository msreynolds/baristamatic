package com.trustwave.baristamatic.event.app
{
	import flash.events.Event;
	
	public class BaristamaticInitializeEvent extends Event
	{
		public static const TYPE:String = "BaristamaticInitializeEvent";
		
		public function BaristamaticInitializeEvent()
		{
			super(TYPE);
		}
	}
}