package com.trustwave.baristamatic.util
{
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductIngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductVO;

	public class ProductUtils
	{
		public static const MAX_INGREDIENT_COUNT:int = 10;
		
		public static function hasAllIngredients(product:ProductVO, inventory:IInventoryModel):Boolean
		{
			var currentIngredientCount:int = 0;
			var ingredientQuantityRequired:int = 0;
			var hasAllIngredients:Boolean = true;
			
			for each (var productIngredient:ProductIngredientVO in product.ingredients)
			{
				currentIngredientCount = inventory.getIngredientCount(productIngredient.ingredient);
				ingredientQuantityRequired = productIngredient.count;
				if (ingredientQuantityRequired > currentIngredientCount)
				{
					hasAllIngredients = false;
					break;
				}
			}
			
			return hasAllIngredients;
		}
		
		public static function productHasIngredient(product:ProductVO, ingredient:IngredientVO):Boolean
		{
			for each (var productIngredient:ProductIngredientVO in product.ingredients)
			{
				if (productIngredient.ingredient == ingredient)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}