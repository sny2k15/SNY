package util
{
	import mx.formatters.DateFormatter;
	
	public class DateFormatterWrapper extends DateFormatter
	{
		public function DateFormatterWrapper()
		{
			super();
		}
		
		public static function parseDate(str:String):Date
		{
			return parseDateString(str);
		}  
	}
}