/**
 * SNYSplashScreen controls the splash screen of the application
 *
 * @author  Shashikanth Kota
 * @version 1.0
 * @since   2015-10-11 
 */

package components
{
	import flash.system.Capabilities;	
	import mx.core.DPIClassification;
	import mx.core.mx_internal;	
	import spark.preloaders.SplashScreen;
	
	use namespace mx_internal

	public class SNYSplashScreen extends SplashScreen
	{
		[Embed(source="../assets/dpi160/om_splash.png")] 
		private var SplashImage160:Class; 
		
		[Embed(source="../assets/dpi240/om_splash.png")] 
		private var SplashImage240:Class; 
		
		[Embed(source="../assets/dpi320/om_splash.png")] 
		private var SplashImage320:Class; 
		
		public function SNYSplashScreen()
		{
			super();
		}
		
		override mx_internal function getImageClass(aspectRatio:String, dpi:Number, resolution:Number):Class 
		{ 
			if (dpi == DPIClassification.DPI_160)
			{
				if (Capabilities.screenResolutionX < 512 && Capabilities.screenResolutionY < 512
					|| Capabilities.cpuArchitecture == "x86")
					return SplashImage160;
				else
					return SplashImage320;
			}
			else if (dpi == DPIClassification.DPI_240) 
				return SplashImage240; 
			else if (dpi == DPIClassification.DPI_320) 
				return SplashImage320; 
			return null; 
		} 
	}
}