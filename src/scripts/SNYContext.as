package scripts
{
	public dynamic class SNYContext
	{
		private static var instance:SNYContext;
		{
			instance = new SNYContext;		
		}
		
		public function SNYContext()
		{
			
		}
		
		public static function setAttribute(name:String, value:*):void
		{
			instance[name] = value;
		}
		
		public static function getAttribute(name:String):*
		{
			if(instance.hasOwnProperty(name))
			{
				return instance[name];
			}
			else
			{
				trace('Context property '+name+' not found');
				return null;
			}
		}
			
	}
}