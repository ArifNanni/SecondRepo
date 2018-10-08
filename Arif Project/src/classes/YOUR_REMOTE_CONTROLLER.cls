global class YOUR_REMOTE_CONTROLLER {
    
    public YOUR_REMOTE_CONTROLLER(ApexPages.StandardController controller){
    } 
    
    @RemoteAction
    global static Boolean Click_Button(Id caseId){
        
        // Your business logic
        
        return true;
    }
}