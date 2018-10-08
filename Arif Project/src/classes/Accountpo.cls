public class Accountpo {

public String Idp = '0010I00001etKC8';
    public String getIdp() {
        return null;
    }
public Accountpo ()
{
  account = new Account();
  account = [select id,name from Account where id =:idp ];
}

    public String Id { get; set; }

    public Account account { get; set; }
}