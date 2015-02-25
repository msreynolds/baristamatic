package com.trustwave.baristamatic.model.vo
{
	//[Bindable]
	public class ProductVO extends ApplicationStateVO
	{
		private var _id:int;
		private var _name:String;
		private var _cost:Number = 0;
		private var _ingredients:Array;
		
		public function ProductVO(id:int, name:String, ingredients:Array)
		{
			_id = id;
			_name = name;
			_ingredients = ingredients;
			
			// sum ingredient cost
			for each (var productIngredient:ProductIngredientVO in ingredients)
			{
				_cost += (productIngredient.ingredient.cost * productIngredient.count);
			}
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get cost():Number
		{
			return _cost;
		}

		public function get ingredients():Array
		{
			return _ingredients;
		}
	}
}