package scripts
{
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;

	public class SNYConstants
	{
		public static const USERNAME:String = "TestUser";
		public static const PASSWORD:String = "TestPassword";
		
		public static const OVERRIDE_DB:Boolean = false;
		public static const EXECUTE_DELETE_STMTS:Boolean = true;
		
		public static const DURATION:int = 500;
		public static const APP_TITLE:String = "Surya Namaskar Yajna";		
		public static const REGISTRATION_MESSAGE:String = "Are you a Volunteer of HSS ?";
		public static const REGISTRATION_SHAKHA_MESSAGE:String = "Which Shakha do you attend ?";
		
		public static const SLIDE_TRANSITION:String = "SLIDE";
		public static const FLIP_TRANSITION:String = "FLIP";
				
		public static const COUNTRIES_URL:String = 'assets/xml/countries.xml';
		public static const STATES_URL:String = 'assets/xml/states.xml';
		public static const FIRST_NAME:String = "First Name";
		public static const LAST_NAME:String = "Last Name";
		public static const AGE:String = "Age";
		public static const GENDER:String = "Gender";
		public static const ADDRESS:String = "Address";
		public static const CITY:String = "City";
		public static const STATE:String = "State";
		public static const COUNTRY:String = "Country";
		public static const ZIP_CODE:String = "ZipCode";
		public static const EMAIL:String = "Email";
		public static const PHONE_NUMBER:String = "Phone Number";
		
		public static const REGISTER:String = "Register";
		public static const UPDATE:String = "Update";
		public static const SAVE:String = "Save";
		
		public static const ADD_COUNT:String = "Add Count";
		public static const EDIT_PROFILE:String = "Edit Profile";
		public static const RESET_COUNT:String = "Reset Count";
		public static const TOTAL_COUNT:String = "Total Count";
		
		public static const AGE_GROUPS:ArrayCollection = new ArrayCollection([{code:'A0B12', desc:'0-12'}, {code:'A13B19', desc:'13-19'}, {code:'A20B35', desc:'20-35'}, {code:'A36B50', desc:'36-50'}, {code:'A51', desc:'51+'}]);
		
		// Member Query
		public static const FIND_MEMBER_QUERY:String = "SELECT * from MEMBER where USERNAME = ? and PASSWORD = ? ORDER BY MEMBER_ID";
		public static const FIND_MEMBER_QUERY_DEFAULT:String = "SELECT * from MEMBER ORDER BY MEMBER_ID";
		public static const ADD_MEMBER_QUERY:String = "INSERT INTO MEMBER (USERNAME, PASSWORD) VALUES(:username,:password)";
		public static const UPDATE_MEMBER_QUERY:String = "UPDATE MEMBER SET USERNAME = :username , PASSWORD = :password where MEMBER_ID = :memberId";
		
		// Person Query
		public static const FIND_PERSON_QUERY_USING_PERSON_ID:String = "SELECT * from PERSON where PERSON_ID = ? ORDER BY PERSON_ID";
		public static const FIND_PERSON_QUERY_USING_MEMBER_ID:String = "SELECT * from PERSON where MEMBER_ID = ? ORDER BY PERSON_ID";
		public static const UPDATE_PERSON_QUERY:String = "UPDATE PERSON SET FIRSTNAME = :firstName , LASTNAME = :lastName , AGE = :age , GENDER = :gender , EMAIL = :email , VOLUNTEER = :volunteer, ADDRESS_ID = :addressId , MEMBER_ID = :memberId, SHAKHA_ID = :shakhaId WHERE PERSON_ID = :personId";
		public static const ADD_PERSON_QUERY:String = "INSERT INTO PERSON (FIRSTNAME, LASTNAME, AGE, GENDER, EMAIL, VOLUNTEER, ADDRESS_ID, MEMBER_ID, SHAKHA_ID) VALUES(:firstName,:lastName, :age, :gender, :email, :volunteer, :addressId,:memberId, :shakhaId)";

		//Shakha Query
		public static const FIND_SHAKHA_QUERY:String = "SELECT * from SHAKHA ORDER BY SHAKHA_ID";
		public static const FIND_SHAKHA_QUERY_USING_SHAKHA_ID:String = "SELECT * from SHAKHA WHERE SHAKHA_ID = ? ORDER BY SHAKHA_ID";

		// Address Query
		public static const FIND_ADDRESS_QUERY_USING_ADDRESS_ID:String = "SELECT * from ADDRESS where ADDRESS_ID = ? ORDER BY ADDRESS_ID";
		public static const UPDATE_ADDRESS_QUERY:String = "UPDATE ADDRESS SET CITY = :city , STATE = :state , COUNTRY = :country , ZIPCODE = :zipCode where ADDRESS_ID = :addressId";
		public static const ADD_ADDRESS_QUERY:String = "INSERT INTO ADDRESS (CITY, STATE, COUNTRY, ZIPCODE) VALUES(:city, :state, :country, :zipCode)";
		
		// Namaskar Query
		public static const FIND_NAMASKAR_QUERY_USING_PERSON_ID:String = "SELECT * from NAMASKAR where PERSON_ID = ? ORDER BY PERSON_ID";
		public static const UPDATE_NAMASKAR_QUERY:String = "UPDATE NAMASKAR SET DATETIME = :dateTime , COUNT = :count , PERSON_ID = :personId where NAMASKAR_ID = :namaskarId";
		public static const ADD_NAMASKAR_QUERY:String = "INSERT INTO NAMASKAR (DATETIME, COUNT, PERSON_ID) VALUES(:dateTime, :count, :personId)";
		public static const DELETE_NAMASKAR_QUERY_USING_PERSON_ID:String = "DELETE FROM NAMASKAR WHERE PERSON_ID = :personId";
		public static const DELETE_NAMASKAR_QUERY_USING_NAMASKAR_ID:String = "DELETE FROM NAMASKAR WHERE NAMASKAR_ID = :namaskarId";
		
		// Generic Queries
		public static const GLOBAL_AVG_QUERY:String = "SELECT  round(avg(n.count),0) as AVG, date(n.datetime) as DATETIME FROM namaskar n GROUP BY (n.datetime) ORDER BY date(n.datetime)";
	}
}