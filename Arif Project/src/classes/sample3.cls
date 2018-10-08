global class sample3 
{
    public String accountName { get; set; }
    public static Account account { get; set; }
    public static boolean flag=true;
    public sample3() { }
    public String canCallYou(){
    Account ab =new Account();
    if(flag)
    {
    flag = false;
     ab = getAccount('Spandanar 1000');
     
    }
    
    
    
    return 'done';}
    
    @RemoteAction
    global static Account getAccount(String accountName) 
    {
        sample3 b = new sample3();
        String abc = b.canCallYou();
        account = [select id, name, phone, type, numberofemployees from Account where name = :accountName limit 1 ];
        return account;
    }
}