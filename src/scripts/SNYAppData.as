package scripts
{
	import mx.collections.ArrayCollection;

	public class SNYAppData
	{
		[Bindable] public static var APP_TITLE:String = "Surya Namaskar Yajna"; 
		[Bindable] public static var ACTION_TITLE:String = ""; 
		[Bindable] public static var PADDING:int = 10;
		[Bindable] public static var VSPACE:int = 10;
		[Bindable] public static var HSPACE:int = 10;
		[Bindable] public static var STAGE_WIDTH:int = 10;
		[Bindable] public static var STAGE_HEIGHT:int = 10;
		[Bindable] public static var MEMBERS:ArrayCollection = new ArrayCollection;
		[Bindable] public static var NAMASKARS:ArrayCollection = new ArrayCollection;
		[Bindable] public static var SHAKHAS:ArrayCollection = new ArrayCollection;
	}
}