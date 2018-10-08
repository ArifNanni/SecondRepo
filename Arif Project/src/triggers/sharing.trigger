trigger sharing on Sharing_Rule_obj__c (before insert) {

 Sharing_Rule_obj__c lstShare = [Select Company__c from Sharing_Rule_obj__c where id = 'a0r0I00004sHu5J' ];
 lstshare.Company__c  = 'TCS';
 update lstshare;
 //System.debug('+++=+++'+lstShare );
 trigger.new[0].Company__c  = 'Wells Fargo';
 System.debug('+++++'+trigger.new[0].id);
 if(ByPass.ByPassVar)
 {
  System.debug('**++==ccominng');
 }
 // AZ.abc();
}