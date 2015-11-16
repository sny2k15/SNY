package dao
{
	import flash.data.SQLStatement;
	
	import model.Member;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	import scripts.SNYDatabase;
	
	import util.SNYUtil;

	public class MemberDAO extends BaseDAO
	{
		public function MemberDAO()
		{
			super();
		}
		
		public function findMember(username:String, password:String):Member
		{
			var sql:String = SNYConstants.FIND_MEMBER_QUERY;
			var result:ArrayCollection = executeQuery(sql, [username, password]);
			return result.length>0?result.getItemAt(0) as Member:null;
		}		
		
		public function findMemberDefault():ArrayCollection
		{
			var sql:String = SNYConstants.FIND_MEMBER_QUERY_DEFAULT;
			var result:ArrayCollection = executeQuery(sql);
			return result;
		}	
		
		public function addMember(member:Member):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			if(!isNaN(member.memberId))
			{
				sqlStatement.text = SNYConstants.UPDATE_MEMBER_QUERY;
				sqlStatement.parameters[':memberId'] = member.memberId;
			}
			else
			{
				sqlStatement.text = SNYConstants.ADD_MEMBER_QUERY;
			}
			sqlStatement.parameters[':username'] = member.username;
			sqlStatement.parameters[':password'] = member.password;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		override protected function processRow(result:Object):Object
		{
			var member:Member = new Member;
			member.memberId = result.MEMBER_ID;
			member.username = result.USERNAME==null?"":result.USERNAME;
			member.password = result.PASSWORD==null?"":result.PASSWORD;			
			return member;
		}
	}
}