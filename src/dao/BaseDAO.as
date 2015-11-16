package dao
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	import scripts.SNYContext;
	import scripts.SNYDatabase;

	public class BaseDAO extends EventDispatcher
	{
		public var sqlConnection:SQLConnection;
		
		public function BaseDAO()
		{
			sqlConnection = SNYDatabase.getConnection();
		}
		
		public function executeQuery(sql:String, params:Array=null, startRow:int=0, pageSize:int=0):ArrayCollection
		{
			var arrayCollection:ArrayCollection = new ArrayCollection();
			var stmt:SQLStatement = new SQLStatement;
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			if(params)
			{
				for(var i:int=0; i<params.length; i++)
				{
					stmt.parameters[i] = params[i];
				}
			}
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if(result != null)
			{
				if(pageSize!=0)
				{
					result = result.slice(startRow, pageSize);					
				}
				for(var j:int=0; j<result.length; j++)
				{
					arrayCollection.addItem(processRow(result[j]));
				}
			}
			return arrayCollection;
		}
		
		protected function processRow(row:Object):Object
		{
			throw new Error("You need to override processRow() in your concrete DAO");
		}
		
	}
}