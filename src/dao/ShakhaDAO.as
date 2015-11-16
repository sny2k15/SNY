package dao
{
	import model.Shakha;
	
	import mx.collections.ArrayCollection;
	
	import scripts.SNYAppData;
	import scripts.SNYConstants;

	public class ShakhaDAO extends BaseDAO
	{
		public function ShakhaDAO()
		{
			super();
		}
		
		public function findShakhas():ArrayCollection
		{
			var sql:String = SNYConstants.FIND_SHAKHA_QUERY;
			var result:ArrayCollection = executeQuery(sql);
			return result;
		}
		
		public function findShakha(shakhaId:Number):Shakha
		{
			if(SNYAppData.SHAKHAS.length>0)
			{
				for each(var shakhaObj:Shakha in SNYAppData.SHAKHAS)
				{
					if(shakhaObj.shakhaId == shakhaId)
					{
						return shakhaObj;
					}
				}
			}
			var sql:String = SNYConstants.FIND_SHAKHA_QUERY_USING_SHAKHA_ID;
			var result:ArrayCollection = executeQuery(sql, [shakhaId]);
			return result.length>0?result.getItemAt(0) as Shakha:null;
		}
		
		override protected function processRow(result:Object):Object
		{
			var shakha:Shakha = new Shakha();
			shakha.shakhaId = result.SHAKHA_ID;
			shakha.shakhaName=result.SHAKHA_NAME==null?"":result.SHAKHA_NAME;	
			shakha.city=result.CITY==null?"":result.CITY;	
			shakha.state=result.STATE==null?"":result.STATE;	
			shakha.sambhag=result.SAMBHAG==null?"":result.SAMBHAG;	
			return shakha;
		}
	}
}