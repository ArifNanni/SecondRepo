/**************************************************************************************
Apex Class Name:  NGEN_ExceptionRequestHandler
Version   : 1.0 
Created Date    : 20 July 2017
Function   : Handler class for Exception Request Trigger
Modification Log :
* Developer                   Date                   Description
* ----------------------------------------------------------------------------                 
* Arif Mohammad           20/July/2017              Original Version
*************************************************************************************/
 Public with sharing class NGEN_ExceptionRequestHandler{

  /*
   * Method name  : afterInsert
   * Description  : handles after insert trigger operation
   * Return Type  : void
   * Parameter    : List<NGEN_ExceptionRequest__c>
   */
    public void afterInsert(List<NGEN_ExceptionRequest__c> newInsertList){
       upsertOfNoOfApprovals(newInsertList);
    }
    
    
    
    /*
   * Method name  : afterUpdate
   * Description  : handles after update trigger operation
   * Return Type  : void
   * Parameter    : Map<id,NGEN_ExceptionRequest__c> , Map<id,NGEN_ExceptionRequest__c>
   */
    public void afterUpdate(Map<id,NGEN_ExceptionRequest__c> newUpdateMap,Map<id,NGEN_ExceptionRequest__c> oldUpdateMap){
       upsertOfNoOfApprovals(newUpdateMap.values());
    }
    
    
  /* Method name  : upsertOfNoOfApprovals
   * Description  : Which inserts the No of Approvals fields for the Exception Record.
   * Return Type  : void
   * Parameter    : List<NGEN_ExceptionRequest__c>
   */  
   public void upsertOfNoOfApprovals(List<NGEN_ExceptionRequest__c> newList){
     List<NGEN_ExceptionRequest__c> li = new list<NGEN_ExceptionRequest__c>();
     Map<String,Integer> customMetadata = new Map<String,Integer>();
        for(NGEN_ExceptionAuthorizationMatrix__mdt NGENCustomMetadata : [SELECT NGEN_Type__c, NGEN_SubType__c , Number_of_approval_steps__c FROM
                                                          NGEN_ExceptionAuthorizationMatrix__mdt])
        {
           
          String dummy1 = '';
          dummy1 = NGENCustomMetadata.NGEN_Type__c + NGENCustomMetadata.NGEN_SubType__c;
          customMetadata.put(dummy1,NGENCustomMetadata.Number_of_approval_steps__c.intValue());
        }  
        
        
      
        for(NGEN_ExceptionRequest__c NGENExceptionRequest : newList)
        {
          String dummy2 = '';
          dummy2 = NGENExceptionRequest.NGEN_ExceptionType__c + NGENExceptionRequest.NGEN_ExceptionSubType__c ;
          NGENExceptionRequest.NGEN_Numberofapprovalsteps__c = customMetadata.get(dummy2);
          
        }
        
    }
    
  }