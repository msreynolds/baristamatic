package com.trustwave.baristamatic.model
{
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	
	import mx.collections.ArrayCollection;

	public interface IInventoryModel
	{
		function get allIngredients():ArrayCollection;
		function set allIngredients(value:ArrayCollection):void;
		
		function addIngredientToCurrentInventory(ingredient:IngredientVO, quantity:int=1):void;
		function removeIngredientFromCurrentInventory(ingredient:IngredientVO, quantity:int=1):void;
		function getIngredientCount(ingredient:IngredientVO):int
			
	}
}