package scripts
{
	import spark.components.ViewNavigator;
	import spark.effects.easing.Bounce;
	import spark.transitions.FlipViewTransition;
	import spark.transitions.FlipViewTransitionMode;
	import spark.transitions.SlideViewTransition;
	import spark.transitions.SlideViewTransitionMode;
	import spark.transitions.ViewTransitionDirection;

	public class SNYTransitions
	{
		private static var bounce:Bounce = new Bounce;
		public static var currentTransition:String = "";
		
		public static function setSlideTransition(navigator:ViewNavigator):void
		{
			var pushTransition:SlideViewTransition = new SlideViewTransition();
			pushTransition.duration = SNYConstants.DURATION;
			pushTransition.easer = bounce;
			pushTransition.mode = SlideViewTransitionMode.COVER;
			pushTransition.direction = ViewTransitionDirection.UP;
			navigator.defaultPushTransition = pushTransition;
			
			var popTransition:SlideViewTransition = new SlideViewTransition();
			popTransition.duration = SNYConstants.DURATION;
			popTransition.easer = bounce;
			popTransition.mode = SlideViewTransitionMode.COVER;
			popTransition.direction = ViewTransitionDirection.DOWN;
			navigator.defaultPopTransition = popTransition;
			
			currentTransition = SNYConstants.SLIDE_TRANSITION;
		}
		
		public static function setFlipTransition(navigator:ViewNavigator):void
		{
			var pushTransition:FlipViewTransition = new FlipViewTransition();
			pushTransition.duration = SNYConstants.DURATION;
			pushTransition.easer = bounce;
			pushTransition.mode = FlipViewTransitionMode.CUBE;
			pushTransition.direction = ViewTransitionDirection.LEFT;
			navigator.defaultPushTransition = pushTransition;
			
			var popTransition:FlipViewTransition = new FlipViewTransition();
			popTransition.duration = SNYConstants.DURATION;
			popTransition.easer = bounce;
			popTransition.mode = FlipViewTransitionMode.CUBE;
			pushTransition.direction = ViewTransitionDirection.RIGHT;
			navigator.defaultPopTransition = popTransition;
			
			currentTransition = SNYConstants.FLIP_TRANSITION;
		}
	}
}