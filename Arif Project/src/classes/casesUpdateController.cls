public with sharing class casesUpdateController {

    public casesUpdateController(ApexPages.StandardController controller) {

    }
    
    public pagereference UpdateRecords(){
        Group QueueId = [select Id from Group where DeveloperName = 'on_hold' and Type = 'Queue'];
        list<case> caseList = new list<case>();
        List<case> caseListQuery = [SELECT id,CreatedById,CaseNumber,origin,Status FROM Case where OwnerId =: QueueId.id ];
        for(case eachCase : caseListQuery)
        {
           case caseUpdate = new case();
           caseUpdate.id = eachCase.id;
           caseUpdate.ownerId = eachCase.CreatedById;
           caseList.add(caseUpdate);
        }
        //Schema.DescribeSObjectResult result = Case.SObjectType.getDescribe();

       // PageReference pageRef = new PageReference('/' + result.getKeyPrefix());
    //   https://nylic--devsum01.lightning.force.com/one/one.app#/sObject/5000n000001ba8XAAQ/view
    //https://arif555-dev-ed.lightning.force.com/one/one.app?source=aloha#/sObject/Case/list?filterName=00B28000008zzN4EAI
    String BaseUrl = System.URL.getSalesforceBaseUrl().toExternalForm();
       String url = BaseUrl+'/one/one.app?source=aloha#/sObject/Case/list?filterName=00B2800000AJEWUEA5';

        System.debug('++++++'+caseList);
       update caseList;
    System.debug('++++++Hi working');
   // return null;
   PageReference pref = new PageReference(url);  
            pref.setRedirect(false);                                
               // return pref;
               return null;
              }

}