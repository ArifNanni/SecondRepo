trigger jiji on Job_Application__c (after update,before update) {
 
 if(Trigger.isBefore)
 system.debug('-------beforetriggerrunning');
 system.debug('-------'+trigger.new);
 list<Job_Application__c> fg = trigger.new;
 Job_Application__c op =new Job_Application__c();
 op.Original__c = 'original';
 if(checkRecursive.runOnce())
   {
 insert op;
 }
}