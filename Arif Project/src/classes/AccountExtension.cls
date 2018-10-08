public with sharing class AccountExtension {
    public Boolean isAdded{get;set;}
    public Boolean isCancel{get;set;}
    public AccountExtension(ApexPages.StandardController controller) {
        isAdded = false;
        isCancel = false;
    }
public pagereference cancelPage(){
    isAdded = false;
    isCancel = true;
    return null;
}
 
public pagereference saveAccount(){
    isAdded = true;
    isCancel = false;
    return null;
}
}