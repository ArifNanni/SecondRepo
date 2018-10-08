trigger abcde  on M11__c (before insert, after insert) {

  if(Trigger.isinsert)
{
 if(Trigger.isbefore)
 {
  System.debug('beforee update');
 }
  if(Trigger.isAfter)
 {
  List<M1__c> M1 = [Select id,wText3__c from  M1__c where id ='a150I00000DfXBC'];
  m1[0].wText3__c = 'true';
  update M1;
  
   List<M1__c> M2 = [Select id,wText3__c from  M1__c where id ='a150I00000DfXBC'];
  m2[0].wText3__c = 'true';
  update M2;
 }
 }
}