package dao
{
	import model.Global;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	
	import util.DateFormatterWrapper;
	
	public class GlobalDAO extends BaseDAO
	{
		public function GlobalDAO()
		{
			super();
		}
		
		public function findGlobalAvg():ArrayCollection
		{
			var sql:String = SNYConstants.GLOBAL_AVG_QUERY;
			var result:ArrayCollection = executeQuery(sql);
			return result;
		}
		
		override protected function processRow(result:Object):Object
		{
			var global:Global = new Global;
			global.dateTime = DateFormatterWrapper.parseDate(result.DATETIME);
			global.globalAvg = result.AVG;
			return global;
		}
	}
}