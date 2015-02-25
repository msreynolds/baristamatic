package com.trustwave.baristamatic.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	[Bindable]
	public class ProductModel extends Actor implements IProductModel
	{
		private var _allProducts:ArrayCollection = new ArrayCollection();
		
		public function get allProducts():ArrayCollection
		{
			return _allProducts;
		}
		
		public function set allProducts(value:ArrayCollection):void
		{
			// Its better to create the array collection only once on init,
			// then replace the underlying array with new data as needed.  
			// This is for binding performance.
			
			if (value)
			{
				_allProducts.source = value.source;
			}
			else
			{
				_allProducts = value;
			}
		}
	}
}