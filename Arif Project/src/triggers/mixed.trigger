trigger mixed on Mixed_DML_Ex__c (before insert,after insert,before update, after update) {

  if(trigger.isInsert && trigger.isAfter)
  {
   for(Integer i=0 ;i<1;i++)
   {
    System.enqueueJob(new QueueableExample());
   }
  }

}