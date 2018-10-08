public class VFPAGETEST {

public boolean btest {get; set;}
public VFPAGETEST()
{
  btest = false;
  return ;
}

    public PageReference Hello() {
      btest=true;
        return null;
    }

}