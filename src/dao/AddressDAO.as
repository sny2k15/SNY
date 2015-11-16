package dao
{
	import flash.data.SQLStatement;
	
	import model.Address;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYConstants;
	import scripts.SNYDatabase;
	
	import util.SNYUtil;

	public class AddressDAO extends BaseDAO
	{
		public function AddressDAO()
		{
			super();
		}
		
		public function findAddress(addressId:Number):Address
		{
			var sql:String = SNYConstants.FIND_ADDRESS_QUERY_USING_ADDRESS_ID;
			var result:ArrayCollection = executeQuery(sql, [addressId]);
			return result.length>0?result.getItemAt(0) as Address:null;
		}
		
		public function addAddress(address:Address):Number
		{
			var sqlStatement:SQLStatement = new SQLStatement();
			if(!isNaN(address.addressId))
			{
				sqlStatement.text = SNYConstants.UPDATE_ADDRESS_QUERY;
				sqlStatement.parameters[':addressId'] = address.addressId;
			}
			else
			{
				sqlStatement.text = SNYConstants.ADD_ADDRESS_QUERY;
			}
			sqlStatement.parameters[':city'] = address.city;
			sqlStatement.parameters[':state'] = address.state;
			sqlStatement.parameters[':country'] = address.country;
			sqlStatement.parameters[':zipCode'] = address.zipCode;
			return SNYUtil.executeStatement(sqlStatement, SNYDatabase.getConnection());
		}
		
		override protected function processRow(result:Object):Object
		{
			var address:Address = new Address();
			address.addressId = result.ADDRESS_ID;
			address.city = result.CITY==null?"":result.CITY;
			address.state = result.STATE==null?"":result.STATE;
			address.country = result.COUNTRY==null?"":result.COUNTRY;
			address.zipCode = result.ZIPCODE==null?"":result.ZIPCODE;
			return address;
		}
	}
}