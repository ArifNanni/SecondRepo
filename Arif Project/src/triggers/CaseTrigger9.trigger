trigger CaseTrigger9 on Case (after insert,after update) {


 
 // System.debug('**********************************beforee update'+Trigger.new[0].Formula__c);
 /* Case c = new Case();
  c.Origin = 'Phone';
  c.Status = 'Working';
  c.Priority = 'Medium';
  System.debug('**********************************');
 
   
   Database.DMLOptions dmo = new Database.DMLOptions();
   c.Subject = 'Hi';*/
     // dmo.assignmentRuleHeader.assignmentRuleId= '01Q28000000soA3';
   //c.setOptions(dmo);
 /* if(constants.flag1)
  {
  constants.flag1 = false;
  insert c;
  }*/
  System.debug('**********************************');
  Database.DMLOptions dmo = new Database.DMLOptions();
  List<Case> cased = new List<case>();
  for(Case c :[Select id from Case where id in:trigger.newMap.keyset() ])
  {
   
  // dmo.assignmentRuleHeader.assignmentRuleId= '01Q28000000soA3';
  // c.setOptions(dmo);
   cased.add(c); 
  }
  
  if(constants.flag1)
  {
  constants.flag1 = false;
  database.update(cased,dmo) ;
  }
  //System.debug('++++++'+c.id);
 
}