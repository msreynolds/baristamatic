package com.trustwave.baristamatic.event.user
{
	import com.trustwave.baristamatic.model.vo.ProductVO;
	
	import flash.events.Event;
	
	public class ProductOrderEvent extends Event
	{
		public static const TYPE:String = "ProductOrderEvent";
		
		private var _product:ProductVO;
		
		public function ProductOrderEvent(product:ProductVO)
		{
			_product = product;
			super(TYPE);
		}
		
		public function get product():ProductVO
		{
			return _product;
		}
	}
}