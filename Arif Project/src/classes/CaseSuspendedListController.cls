public with sharing class CaseSuspendedListController
{
  @AuraEnabled
    public static List<Case> getAll() {
     // queuesobject queue = [select id from queuesobject where queue.name='on_hold'];
      system.debug('---calling controller');
        return [SELECT id,CaseNumber,Owner.Name FROM Case ];
    }
}