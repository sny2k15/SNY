package util
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.data.SQLTransactionLockType;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	
	import scripts.SNYConstants;

	public class SNYUtil
	{
		
		public static function executeBatch(file:File, connection:SQLConnection):void
		{
			var stream:FileStream = new FileStream;
			stream.open(file, FileMode.READ);
			var xml:XML = XML(stream.readUTFBytes(stream.bytesAvailable));
			stream.close();
			connection.begin(SQLTransactionLockType.IMMEDIATE);
			for each(var xmlStatement:XML in xml.statement)
			{
				var stmt:SQLStatement = new SQLStatement;
				stmt.sqlConnection = connection;
				if(('@execute' in xmlStatement) && (xmlStatement.@execute != SNYConstants.EXECUTE_DELETE_STMTS)){
					continue;
				}
				stmt.text = xmlStatement;
				stmt.execute();
			}
			connection.commit();
		}
		
		public static function executeSQLStatement(sql:String, connection:SQLConnection):Number
		{
			trace('SQL:'+sql);
			connection.begin(SQLTransactionLockType.IMMEDIATE);
			var stmt:SQLStatement = new SQLStatement;
			stmt.sqlConnection = connection;
			stmt.text = sql;
			stmt.execute();
			connection.commit();
			return connection.lastInsertRowID;
		}
		
		public static function executeStatement(stmt:SQLStatement, connection:SQLConnection):Number
		{
			connection.begin(SQLTransactionLockType.IMMEDIATE);
			var stmt:SQLStatement = stmt;
			stmt.sqlConnection = connection;
			stmt.execute();
			connection.commit();
			return connection.lastInsertRowID;
		}
	}
}