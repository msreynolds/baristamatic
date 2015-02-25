package com.trustwave.baristamatic.command.user
{
	import com.trustwave.baristamatic.event.message.InventoryRestockConfirmMessageEvent;
	import com.trustwave.baristamatic.event.user.InventoryRestockEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductVO;
	import com.trustwave.baristamatic.util.ProductUtils;
	
	import org.robotlegs.mvcs.Command;
	
	public class InventoryRestockCommand extends Command
	{
		[Inject]
		public var inventoryRestockEvent:InventoryRestockEvent;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		[Inject]
		public var productModel:IProductModel;
		
		override public function execute():void
		{	
			var currentIngredientCount:int = 0;
			for each (var ingredient:IngredientVO in inventoryModel.allIngredients)
			{
				// Stock All Ingredients
				currentIngredientCount = inventoryModel.getIngredientCount(ingredient);
				inventoryModel.addIngredientToCurrentInventory(ingredient, (ProductUtils.MAX_INGREDIENT_COUNT - currentIngredientCount));
				
				// Update Ingredient Counts
				ingredient.count = inventoryModel.getIngredientCount(ingredient);
			}
			
			// Update Product Availability
			for each (var product:ProductVO in productModel.allProducts)
			{
				product.inStock = ProductUtils.hasAllIngredients(product, inventoryModel);
			}
			
			dispatch(new InventoryRestockConfirmMessageEvent());
			
			super.execute();
		}
	}
}