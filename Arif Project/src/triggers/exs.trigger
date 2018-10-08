trigger exs on Recurrsive_Obj__c (before update,after update,before insert, after insert,before delete ,after delete) {

  if(trigger.isInsert && trigger.isBefore)
  {
  
   
 
   for(Recurrsive_Obj__c d :trigger.new)
   {
   Boolean flag = d.Contactluck__c !=null && (d.Number__c == 0/0);
   System.debug('++'+d.Number__c);
   System.debug('--'+(d.Number__c > 3));
   if( flag )
   {
   
   }
   if(d.Number__c > 3)
   {
    System.debug('Hi');
   }
   
   }
  
   
 }  
   
  
  
  
  
  

}