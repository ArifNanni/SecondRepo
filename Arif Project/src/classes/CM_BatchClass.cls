global class CM_BatchClass implements Database.Batchable<sObject> {

   global Database.QueryLocator start(Database.BatchableContext BC) {
   
     String query = 'SELECT Id, Text__c FROM Queueable__c limit 1' ;     
    
     return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Queueable__c> scope) {
     
     for(Queueable__c rec : scope)
     {
       rec.Text__c = rec.Text__c + 'a';
     }
     update scope;
     
   }
   
   global void finish(Database.BatchableContext BC) {
   
   }

}