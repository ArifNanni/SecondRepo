public with sharing class Reload{
    public Integer myInt { get; set; }
    public Reload(){
    system.debug('---constructor--');
        myInt = 0;
    }
    public pagereference processtempcon(){
        pagereference p = apexpages.Currentpage();
        
        system.debug('---process--');
        apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'Total Number of reloads: ' + (myInt++));
        apexpages.addmessage(msg);
        p.setredirect(true);
        return p; 
    }
}