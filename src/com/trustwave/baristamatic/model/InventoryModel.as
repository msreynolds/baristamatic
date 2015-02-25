package com.trustwave.baristamatic.model
{
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.mvcs.Actor;
	
	[Bindable]
	public class InventoryModel extends Actor implements IInventoryModel
	{
		private var _allIngredients:ArrayCollection = new ArrayCollection();
		private var _currentInventory:Dictionary = new Dictionary(true);
		
		public function get allIngredients():ArrayCollection
		{
			return _allIngredients;
		}
		
		public function set allIngredients(value:ArrayCollection):void
		{
			// Its better to create the array collection only once on init,
			// then replace the underlying array with new data as needed.  
			// This is for binding performance.
			
			if (value)
			{
				_allIngredients.source = value.source;
			}
			else
			{
				_allIngredients = value;
			}
		}
		
		// Adds an item to the current inventory
		public function addIngredientToCurrentInventory(ingredient:IngredientVO, quantity:int=1):void
		{
			var currentCount:int = (_currentInventory[ingredient.id] ? _currentInventory[ingredient.id] : 0);
			_currentInventory[ingredient.id] = (currentCount+quantity);
		}
		
		// Assumes inventory is stocked with the required ingredient
		public function removeIngredientFromCurrentInventory(ingredient:IngredientVO, quantity:int=1):void
		{
			var currentCount:int = _currentInventory[ingredient.id];
			_currentInventory[ingredient.id] = (currentCount-quantity);
		}
		
		// Returns integer count of the current number of the given ingredient
		public function getIngredientCount(ingredient:IngredientVO):int
		{
			return _currentInventory[ingredient.id];
		}
	}
}