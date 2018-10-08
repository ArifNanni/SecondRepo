public class Example3 {

    public Account[] myval { get; set; }
    public Example3()
     {
    Account a1=new Account(name='Arun',industry='Banking'); 
    Account a2=new Account(name='Babu',industry='Bankcing');
     Account a3=new Account(name='chanti',industry='Banking');
     myval=new Account[]{a1,a2,a3};
     }
}