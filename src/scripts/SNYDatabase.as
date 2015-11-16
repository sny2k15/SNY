package scripts
{
	import flash.data.SQLConnection;
	import flash.filesystem.File;
	
	import util.SNYUtil;

	public class SNYDatabase
	{
		private static var targetFile:File = File.applicationDirectory.resolvePath("SNY.db");
		private static var sqlConnection:SQLConnection;
		
		public static function getConnection():SQLConnection
		{
			if(sqlConnection==null)
			{
				sqlConnection = new SQLConnection;
				sqlConnection.open(targetFile);
				if(!targetFile.exists || SNYConstants.OVERRIDE_DB)
				{
					SNYUtil.executeBatch(File.applicationDirectory.resolvePath("sql" + File.separator + "sql.xml"), sqlConnection);
				}
			}
			return sqlConnection;
		}
	}
}