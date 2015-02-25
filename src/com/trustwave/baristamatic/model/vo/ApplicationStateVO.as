package com.trustwave.baristamatic.model.vo
{
	import com.trustwave.baristamatic.util.ProductUtils;

	// These variables are used to drive state decisions in the UI
	public class ApplicationStateVO
	{
		[Bindable]
		public var isOn:Boolean=false;
		
		[Bindable]
		public var inStock:Boolean=true;
		
		[Bindable]
		public var count:int = ProductUtils.MAX_INGREDIENT_COUNT;
		
		public function ApplicationStateVO()
		{
		}
	}
}