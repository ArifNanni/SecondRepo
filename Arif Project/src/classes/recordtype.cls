Public class recordtype
{
    /**
      * This function return the recordTypeId of a recordType of an object.
      * @strObj - This will accept the object name.
      * @strRecordTypeName - This will accept the recordTypeName for the record according to @strObj.
      * @author: Aquib Javed
    
      public static Id getRecordType(String strObj, String strRecordTypeName){
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.DescribeSObjectResult objDetails = schemaMap.get(strObj).getDescribe();
            // map<string,Schema.RecordTypeInfo>  -- objDetails.getRecordTypeInfosByName()
            return objDetails.getRecordTypeInfosByName().get(strRecordTypeName).getRecordTypeId();
          }
          
          
          
                    Map<String,Schema.SObjectType>   
                                                           Schema.DescribeSObjectResult
                                                                         Map<String,Schema.SObjectField>
System.debug('a+++'+Schema.getGlobalDescribe().get('Case').getDescribe().fields.getMap());



 // Initialize setup variables
               String objectName = 'Case';  // modify as needed
               String query = 'SELECT';
               Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get(objectName).getDescribe().fields.getMap();

          // Grab the fields from the describe method and append them to the queryString one by one.
              for(String s : objectFields.keySet()) {
              query += ' ' + s + ',';
          }
          
          
          // Strip off the last comma if it exists.
             if (query.subString(query.Length()-1,query.Length()) == ','){
             query = query.subString(0,query.Length()-1);
            }

         // Add FROM statement
            query += ' FROM ' + objectName;
            
           
            
            String str1 = CM_CNBIntegrationUtility.getRecordType('Case' , System.Label.Case_record_Type_Name_Card_Fraud_Servicing);
            String str2 = CM_CNBIntegrationUtility.getRecordType('Case' , System.Label.CM_Case_record_TypeName_Card_Fraud_Review);
            Set<id> ids = mapNewCases.keySet();
            String str3 = 'Closed';
         // Add on a WHERE/ORDER/LIMIT statement as needed
         
          query += ' WHERE Status =: str3  AND Id IN : ids  AND (RecordTypeId =: str1 OR RecordTypeId =:str2)'; 
                    //      RecordTypeId =: CM_CNBIntegrationUtility.getRecordType('Case' , System.Label.CM_Case_record_TypeName_Card_Fraud_Review)) '; // modify as needed
            

      /**/

}