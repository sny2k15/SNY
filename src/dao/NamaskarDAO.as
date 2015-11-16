package dao
{
	import flash.data.SQLStatement;
	
	import model.Namaskar;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	import scripts.SNYDatabase;
	
	import util.SNYUtil;

	public class NamaskarDAO extends BaseDAO
	{
		public function NamaskarDAO()
		{
			super();
		}
		
		public function findNamaskars(personId:Number):ArrayCollection
		{
			var sql:String = SNYConstants.FIND_NAMASKAR_QUERY_USING_PERSON_ID;
			var result:ArrayCollection = executeQuery(sql, [personId]);
			return result;
		}
		
		public function deleteNamaskars(personId:Number):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			sqlStatement.text = SNYConstants.DELETE_NAMASKAR_QUERY_USING_PERSON_ID;
			sqlStatement.parameters[':personId'] = personId;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		public function deleteNamaskar(namaskarId:Number):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			sqlStatement.text = SNYConstants.DELETE_NAMASKAR_QUERY_USING_NAMASKAR_ID;
			sqlStatement.parameters[':namaskarId'] = namaskarId;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		public function addNamaskar(namaskar:Namaskar):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			if(!isNaN(namaskar.namaskarId))
			{
				sqlStatement.text = SNYConstants.UPDATE_NAMASKAR_QUERY;
				sqlStatement.parameters[':namaskarId'] = namaskar.namaskarId;
			}
			else
			{
				sqlStatement.text = SNYConstants.ADD_NAMASKAR_QUERY;
			}
			sqlStatement.parameters[':dateTime'] = namaskar.dateTime;
			sqlStatement.parameters[':count'] = namaskar.count;
			sqlStatement.parameters[':personId'] = namaskar.personId;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		override protected function processRow(result:Object):Object
		{
			var namaskar:Namaskar = new Namaskar();
			namaskar.namaskarId = result.NAMASKAR_ID;
			namaskar.dateTime = result.DATETIME;
			namaskar.count = result.COUNT;
			namaskar.personId = result.PERSON_ID;
			return namaskar;
		}
	}
}