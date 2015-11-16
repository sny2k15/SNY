package dao
{
	import flash.data.SQLStatement;
	
	import model.Person;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	import scripts.SNYDatabase;
	
	import util.SNYUtil;

	public class PersonDAO extends BaseDAO
	{
		public function PersonDAO()
		{
			super();
		}
		
		public function findPerson(personId:String):Person
		{
			var sql:String = SNYConstants.FIND_PERSON_QUERY_USING_PERSON_ID;
			var result:ArrayCollection = executeQuery(sql, [personId]);
			return result.length>0?result.getItemAt(0) as Person:null;
		}
		
		public function findPersons(memberId:Number):ArrayCollection
		{
			var sql:String = SNYConstants.FIND_PERSON_QUERY_USING_MEMBER_ID;
			var result:ArrayCollection = executeQuery(sql, [memberId]);
			return result;
		}
		
		public function addPerson(person:Person):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			if(!isNaN(person.personId))
			{
				sqlStatement.text = SNYConstants.UPDATE_PERSON_QUERY;
				sqlStatement.parameters[':personId'] = person.personId;
			}
			else
			{
				sqlStatement.text = SNYConstants.ADD_PERSON_QUERY;
			}
			sqlStatement.parameters[':firstName'] = person.firstName;
			sqlStatement.parameters[':lastName'] = person.lastName;
			sqlStatement.parameters[':age'] = person.age;
			sqlStatement.parameters[':gender'] = person.gender;
			sqlStatement.parameters[':email'] = person.email;
			sqlStatement.parameters[':volunteer'] = person.volunteer;
			sqlStatement.parameters[':addressId'] = person.addressId;
			sqlStatement.parameters[':memberId'] = person.memberId;
			sqlStatement.parameters[':shakhaId'] = person.shakhaId;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		override protected function processRow(result:Object):Object
		{
			var person:Person = new Person;
			person.personId = result.PERSON_ID;
			person.firstName = result.FIRSTNAME==null?"":result.FIRSTNAME;
			person.lastName = result.LASTNAME==null?"":result.LASTNAME;
			person.age = result.AGE==null?"":result.AGE;
			person.gender = result.GENDER==null?"":result.GENDER;
			person.email = result.EMAIL==null?"":result.EMAIL;
			person.volunteer = result.VOLUNTEER==null?0:result.VOLUNTEER;
			person.addressId = result.ADDRESS_ID==null?0:result.ADDRESS_ID;
			person.memberId = result.MEMBER_ID==null?0:result.MEMBER_ID;	
			person.shakhaId = result.SHAKHA_ID==null?0:result.SHAKHA_ID;	
			return person;
		}
	}
}