trigger poc on pocrecurrsive__c (before insert,after insert) {
 
 if(Trigger.isBefore)
 {
   system.debug('-------beforetriggerrunning');
   system.debug('-------'+trigger.new.size());
   system.debug('-------'+trigger.new);
 
 
 if(checkRecursive.runOnce())
   {
    system.debug('creating object reference1');
    pocrecurrsive__c op1 =new pocrecurrsive__c();
    op1.name = 'yes1';
    op1.Original__c = 'original';
    system.debug('creating object reference2');
    pocrecurrsive__c op2 =new pocrecurrsive__c();
    op2.name = 'yes2';
    op2.Original__c = 'original';
    system.debug('listu');
    List<pocrecurrsive__c> lst = new List<pocrecurrsive__c>();
    lst.add(op1);
    lst.add(op2);
   system.debug('----inserting list');
   insert lst;
   system.debug('----inserting listed');
  }
  system.debug('fine'+trigger.new.size());
  trigger.new[0].name = 'Allll';
  system.debug('perfect');
 }
 
 if(Trigger.isAfter)
 {
   system.debug('-------aftertriggerrunning');
   system.debug('-------'+trigger.new.size());
   system.debug('-------'+trigger.new);
 }
}