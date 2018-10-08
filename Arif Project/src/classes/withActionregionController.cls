public class withActionregionController {
    public Account acc{get;set;}
    public Boolean showPhone{get;set;}
     
    public withActionregionController(){
        acc = new Account();
        showPhone = false;
        System.debug('ConstructorSLA'+acc.SLA__c);
        System.debug('ConstructorRating'+acc.Rating);
        System.debug('ConstructorAccountName'+acc.name);
        System.debug('ConstructorAccount'+acc);
        
    }
     
    public PageReference priorityChanged(){
        System.debug('MethodSLA'+acc.SLA__c);
        System.debug('MethodRating'+acc.Rating);
        System.debug('MethodAccountName'+acc.name);
        System.debug('MethodAccount'+acc);
        if(acc.CustomerPriority__c == 'High'){
            showPhone = true;
        }
        else{
            showPhone = false;
        }
        return null;
    }
}