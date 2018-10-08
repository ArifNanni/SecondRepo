public class aeryt {
public aeryt()
{
 b=a;
 System.debug('+++privatecon'+a);
    System.debug('+++publiccon'+b);
}
    public PageReference a() {
    System.debug('+++privatesave'+a);
    System.debug('+++publicsave'+b);
        return null;
    }

private integer a=5;
public integer b{get ;set;}

}