public class childParent{

public static void asd()
{
integer a=8;
List<Account> acclst = [select id ,(Select id from contacts limit 2) from Account where id = '0010I00001etKC8'];

for(Account acc : acclst)
    
{
    System.debug('+++'+acc.contacts.isEmpty());
    
    
    
}

}


}