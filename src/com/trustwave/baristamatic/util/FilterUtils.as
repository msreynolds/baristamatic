package com.trustwave.baristamatic.util
{
	import spark.filters.DropShadowFilter;
	import spark.filters.GlowFilter;

	public class FilterUtils
	{
		public static const BLACK_GLOW_SMALL:GlowFilter = new GlowFilter(0x000000, 1, 5, 5, 2);
		public static const GREEN_GLOW_SMALL:GlowFilter = new GlowFilter(0xACED78, 1, 3, 3);
		public static const GREEN_GLOW_LARGE:GlowFilter = new GlowFilter(0xACED78, 0.95, 11, 11, 3);
		
		public static const BLUE_GLOW_MEDIUM:GlowFilter = new GlowFilter(0x4DB6FD, 0.95, 6, 6, 3);
		public static const BLUE_GLOW_LARGE:GlowFilter = new GlowFilter(0x4DB6FD, 0.95, 11, 11, 3);
		
		public static const NAVY_GLOW_MEDIUM:GlowFilter = new GlowFilter(0x00B7FF, 0.21, 7, 7);
		public static const NAVY_GLOW_LARGE:GlowFilter = new GlowFilter(0x00B7FF, 0.21, 12, 12);
		
		public static const INSET_GLOW_SMALL:GlowFilter = new GlowFilter(0x141414, 0.85, 10, 10, 1, 1, true);
		public static const INSET_SHADOW_SMALL:DropShadowFilter = new DropShadowFilter(5, 45, 0x141414, 0.85, 7, 7, 1, 1, true);
	}
}