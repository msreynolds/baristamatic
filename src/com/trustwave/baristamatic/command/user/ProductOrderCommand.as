package com.trustwave.baristamatic.command.user
{
	import com.trustwave.baristamatic.event.message.ProductOrderConfirmMessageEvent;
	import com.trustwave.baristamatic.event.user.ProductOrderEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductIngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductVO;
	import com.trustwave.baristamatic.util.ProductUtils;
	
	import org.robotlegs.mvcs.Command;
	
	public class ProductOrderCommand extends Command
	{
		[Inject]
		public var productOrderEvent:ProductOrderEvent;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		[Inject]
		public var productModel:IProductModel;
		
		override public function execute():void
		{
			for each (var productIngredient:ProductIngredientVO in productOrderEvent.product.ingredients) 
			{
				inventoryModel.removeIngredientFromCurrentInventory(productIngredient.ingredient, productIngredient.count);
			}
			
			for each (var ingredient:IngredientVO in inventoryModel.allIngredients)
			{
				ingredient.count = inventoryModel.getIngredientCount(ingredient);
			}
			
			for each (var product:ProductVO in productModel.allProducts)
			{
				product.inStock = ProductUtils.hasAllIngredients(product, inventoryModel);
			}

			dispatch(new ProductOrderConfirmMessageEvent(productOrderEvent.product.name, productOrderEvent.product.cost));
			
			super.execute();	
		}
		
	}
}