package com.trustwave.baristamatic.model
{
	import mx.collections.ArrayCollection;

	public interface IProductModel
	{
		function get allProducts():ArrayCollection;
		function set allProducts(value:ArrayCollection):void;
	}
}