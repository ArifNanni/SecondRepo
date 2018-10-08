trigger dum on System_Validation__c (before insert) {
trigger.new[0].Number2__c   = 9;
trigger.new[0].Number1__c   = 9;
}