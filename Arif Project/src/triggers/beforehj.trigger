trigger beforehj on RecordTypeObject__c (before insert) {
  for(RecordTypeObject__c  sd:trigger.new)
  {
    //sd.RecordTypeId = '012280000019Y2e';
    
  }
 
}