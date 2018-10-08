public with sharing class PagesController 
{
    public Account account {get;set;}
    public Contact contact {get;set;}

    public PagesController()
    {
        account = new Account();
        account.name='Arif';
        contact = new Contact();            
    }

    public PageReference page2()
    {
        Pagereference p =page.page2;
        p.setRedirect(true);
        return p;
    }
}