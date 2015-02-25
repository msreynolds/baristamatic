package com.trustwave.baristamatic.model.vo
{
	//[Bindable]
	public class ProductIngredientVO
	{
		private var _ingredient:IngredientVO;
		private var _count:int;
		
		public function ProductIngredientVO(ingredient:IngredientVO, count:int)
		{
			_ingredient = ingredient;
			_count = count;
			
		}
		
		public function get ingredient():IngredientVO
		{
			return _ingredient;
		}

		public function get count():int
		{
			return _count;
		}
	}
}