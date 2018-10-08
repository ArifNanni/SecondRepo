public with sharing class test1{
    public Integer myInt { get; set; }
    public test1(){
        myInt = 0;
    }
    public pagereference processtempcon(){
        pagereference p = apexpages.Currentpage();
        apexpages.Message msg = new Apexpages.Message(ApexPages.Severity.Info,'Total Number of reloads: ' + (myInt++));
        apexpages.addmessage(msg);
        return p; 
    }
}