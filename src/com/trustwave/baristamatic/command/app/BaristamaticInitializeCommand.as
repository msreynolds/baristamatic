package com.trustwave.baristamatic.command.app
{
	import com.trustwave.baristamatic.event.user.InventoryRestockEvent;
	import com.trustwave.baristamatic.model.IInventoryModel;
	import com.trustwave.baristamatic.model.IProductModel;
	import com.trustwave.baristamatic.model.vo.IngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductIngredientVO;
	import com.trustwave.baristamatic.model.vo.ProductVO;
	
	import mx.collections.ArrayCollection;
	
	import spark.collections.Sort;
	import spark.collections.SortField;
	
	import org.robotlegs.mvcs.Command;
	
	public class BaristamaticInitializeCommand extends Command
	{
		protected static const COCOA_INGREDIENT:IngredientVO = new IngredientVO(1, 'Cocoa', 0.90);
		protected static const COFFEE_INGREDIENT:IngredientVO = new IngredientVO(2, 'Coffee', 0.75);
		protected static const CREAM_INGREDIENT:IngredientVO = new IngredientVO(3, 'Cream', 0.25);
		protected static const DECAF_COFFEE_INGREDIENT:IngredientVO = new IngredientVO(4, 'Decaf Coffee', 0.75);
		protected static const ESPRESSO_INGREDIENT:IngredientVO = new IngredientVO(5, 'Espresso', 1.10);
		protected static const FOAMED_MILK_INGREDIENT:IngredientVO = new IngredientVO(6, 'Foamed Milk', 0.35);
		protected static const STEAMED_MILK_INGREDIENT:IngredientVO = new IngredientVO(7, 'Steamed Milk', 0.35);
		protected static const SUGAR_INGREDIENT:IngredientVO = new IngredientVO(8, 'Sugar', 0.25);
		protected static const WHIPPED_CREAM_INGREDIENT:IngredientVO = new IngredientVO(9, 'Whipped Cream', 1.00);
		
		
		protected static const CAFFE_AMERICANO:ProductVO = new ProductVO(10, 'Caffe Americano', [ new ProductIngredientVO(ESPRESSO_INGREDIENT, 3) ]);
		
		
		protected static const CAFFE_LATTE:ProductVO = new ProductVO(11, 'Caffe Latte', [ new ProductIngredientVO(ESPRESSO_INGREDIENT, 2), 
																						  new ProductIngredientVO(STEAMED_MILK_INGREDIENT, 1) ]);
																			  
		protected static const CAFFE_MOCHA:ProductVO = new ProductVO(12, 'Caffe Mocha', [ new ProductIngredientVO(COCOA_INGREDIENT, 1), 
																		 	   			  new ProductIngredientVO(ESPRESSO_INGREDIENT, 1), 
																		 	   			  new ProductIngredientVO(STEAMED_MILK_INGREDIENT, 1), 
																		 	   			  new ProductIngredientVO(WHIPPED_CREAM_INGREDIENT, 1) ]);
		
		protected static const CAPPUCCINO:ProductVO = new ProductVO(13, 'Cappuccino', [ new ProductIngredientVO(ESPRESSO_INGREDIENT, 2), 
																			 			new ProductIngredientVO(FOAMED_MILK_INGREDIENT, 1),
																			 			new ProductIngredientVO(STEAMED_MILK_INGREDIENT, 1) ]);
		
		protected static const COFFEE:ProductVO = new ProductVO(14, 'Coffee', [ new ProductIngredientVO(COFFEE_INGREDIENT, 1),
																	 			new ProductIngredientVO(CREAM_INGREDIENT, 1),
																	 			new ProductIngredientVO(SUGAR_INGREDIENT, 1) ]);
		
		protected static const DECAF_COFFEE:ProductVO = new ProductVO(15, 'Decaf Coffee', [ new ProductIngredientVO(DECAF_COFFEE_INGREDIENT, 1),
																				 			new ProductIngredientVO(CREAM_INGREDIENT, 1),
																				 			new ProductIngredientVO(SUGAR_INGREDIENT, 1) ]);
	
		// 7th Test Item
		protected static const CAFFE_ITALIANO:ProductVO = new ProductVO(10, 'Caffe Italiano', [ new ProductIngredientVO(ESPRESSO_INGREDIENT, 2) ]);
		
		
		
		[Inject]
		public var productModel:IProductModel;
		
		[Inject]
		public var inventoryModel:IInventoryModel;
		
		override public function execute():void
		{	
			var productSort:Sort = new Sort();
			productSort.fields = [new SortField('name')];
			
			productModel.allProducts = new ArrayCollection([CAFFE_AMERICANO, 
															CAFFE_MOCHA, 	// out of alphabetical order to verify sorting works
															CAFFE_LATTE, 
															CAPPUCCINO, 
															COFFEE,
															//CAFFE_ITALIANO, // test layout/scroll with additional products
														    DECAF_COFFEE]);
			
			productModel.allProducts.sort = productSort;
			productModel.allProducts.refresh();
			
			inventoryModel.allIngredients = new ArrayCollection([COCOA_INGREDIENT, 
																 COFFEE_INGREDIENT, 
																 CREAM_INGREDIENT, 
																 DECAF_COFFEE_INGREDIENT, 
																 ESPRESSO_INGREDIENT, 
																 FOAMED_MILK_INGREDIENT, 
																 STEAMED_MILK_INGREDIENT, 
																 SUGAR_INGREDIENT, 
																 WHIPPED_CREAM_INGREDIENT]);
			
			dispatch( new InventoryRestockEvent() );
			
			super.execute();
		}
	}
}