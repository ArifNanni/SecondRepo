public class recordtypeController {
    public static Map<Id, String> recordtypemap {get;set;}
    public static List<String> recordtypelst {get;set;}
    
   @AuraEnabled        
    public static List<String> fetchRecordTypeValues(){
        List<Schema.RecordTypeInfo> recordtypes = Case.SObjectType.getDescribe().getRecordTypeInfos();    
        recordtypemap = new Map<Id, String>();
        recordtypelst = new List<String>();
        Boolean isExistRecordType = false;
        for(RecordTypeInfo rt : recordtypes){
            if(rt.getName() == 'Master' && rt.isDefaultRecordTypeMapping()  && rt.isAvailable())
            {             
             recordtypelst.add(rt.getName()); 
             break;
            }
            if( rt.getName() != 'Master' &&  rt.isAvailable())
            {
              if(!isExistRecordType)
              {
               recordtypelst.add('');
               isExistRecordType = true;
              }
              if(rt.isDefaultRecordTypeMapping())
              {
               recordtypelst[0] = rt.getName();
              }
              else
              {
               recordtypelst.add(rt.getName()); 
              }
            }
        }        
     
          return recordtypelst;
    }
    
    @AuraEnabled
    public static Id getRecTypeId(String recordTypeLabel){
        Id recid = Schema.SObjectType.Case.getRecordTypeInfosByName().get(recordTypeLabel).getRecordTypeId();        
        return recid;
    }      
}