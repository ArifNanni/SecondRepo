public class MyController4 {

    Account a=new Account();


    Account account{get{return account;}}

 

    public PageReference save() {
    update account;
    try{

        
    }
    catch(DmlException ex){

        ApexPages.addMessages(ex);
    }
    System.debug('-----hi');
    return null;
    }
 
    public String getName() {
        return 'MyController1';
    }
    
    public void setAccount(Account a) {
    }
   /*  public Account getAccount() {
        if(account == null)
        account = [select id, name, numberofemployees, numberoflocations__c from Account
        where id = :ApexPages.currentPage().getParameters().get('id')];
        return account;
    }*/
   
}