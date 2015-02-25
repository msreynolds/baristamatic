package com.trustwave.baristamatic.model.vo
{
	//[Bindable]
	public class IngredientVO extends ApplicationStateVO
	{
		private var _id:int;
		private var _name:String;
		private var _cost:Number;
		
		public function IngredientVO(id:int, name:String, cost:Number)
		{
			_id = id;
			_name = name;
			_cost = cost;
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
	}
}