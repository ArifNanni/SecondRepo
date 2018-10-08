public class thousandLimit
{
    private limitWrapper[] thousandBlocks = new limitWrapper[]{};
    
    private final integer listLimit;
   
    public thousandLimit()
    {
        listLimit = 1000;
    }
    
    public limitWrapper[] getthousandBlocks()
    {
     System.debug('+++===***');
        thousandBlocks = new limitWrapper[]{};
        
        integer counter = 0;
        integer loopCount = 0;
        Account[] tmpcase = new Account[]{};
        
        for(Account c:[select Name,owner.name from Account])
        {
            if(counter < listLimit)
            {
                tmpcase.add(c);
                counter++;
            }
            else
            {
                loopCount++;
                thousandBlocks.add(new limitWrapper(tmpcase,loopCount));
                tmpcase = new Account[]{};
                tmpcase.add(c);
                counter = 0;
            }            
        }
        
        if(thousandBlocks.size() == 0)
        {
            loopCount++;
            thousandBlocks.add(new limitWrapper(tmpcase,loopCount));
        }
        else
        {
        loopCount++;
        thousandBlocks.add(new limitWrapper(tmpcase,loopCount));
        }
        return thousandBlocks;
    }
    
    public class limitWrapper
    {
        public Account [] Accountss{get;set;}
        public integer blockNumber {get;set;}
        public limitWrapper(Account[] accs, integer i)
        {
            Accountss = accs;
            blockNumber = i;
        }
        
    }
}