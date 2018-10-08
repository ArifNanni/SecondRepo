trigger sample1 on position__c (before insert) {
list<position__c> my=[select Close_Date__c,position_name__c from position__c];
}