trigger parentobj on ParentObj__c (after insert) {

 if((trigger.isInsert||trigger.isUpdate) && trigger.isAfter){
 
  List<ParentObj__share> c = new List<ParentObj__share>();
  for(ParentObj__c t : trigger.new){
     ParentObj__share t1 = new ParentObj__share();
     t1.parentId = t.id;
     //Arif id
   //  t1.UserOrGroupId = '00528000004NBVX';
     t1.AccessLevel = 'edit';
     //Cynthia id
     t1.UserOrGroupId = '00528000004OVFM';
     t1.RowCause = Schema.ParentObj__share.RowCause.Apex_Share_Record__c;
     c.add(t1);
     
  }
   insert c;
   
 }

}