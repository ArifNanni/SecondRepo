public class thousandLimitCase
{
    private limitWrapper[] thousandBlocks = new limitWrapper[]{};
    
    private final integer listLimit;
   
    public thousandLimitCase()
    {
        listLimit = 1000;
    }
    
    public limitWrapper[] getthousandBlocks()
    {
     System.debug('+++===***');
        thousandBlocks = new limitWrapper[]{};
        
        integer counter = 0;
        integer loopCount = 0;
        Case[] tmpcase = new Case[]{};
        
        for(Case c:[select CaseNumber,owner.name from Case])
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
                tmpcase = new Case[]{};
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
        public Case [] Accountss{get;set;}
        public integer blockNumber {get;set;}
        public limitWrapper(Case[] accs, integer i)
        {
            Accountss = accs;
            blockNumber = i;
        }
        
    }
}