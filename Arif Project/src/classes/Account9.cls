public class Account9 {
public Account a = [select id,name from Account limit 1];
public Account9()
{
system.debug('-------controlerr');
}

    public Account account { get; set; }
}