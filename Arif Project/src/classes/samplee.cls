global class samplee 
{
    public String accountName { get; set; }
    public static Account account { get; set; }
    public samplee() { }
    
    @RemoteAction
    global static Account getAccount(String accountName) 
    {
        account = [select id, name, phone, type, numberofemployees from Account where name = :accountName limit 1];
        return account;
    }
}