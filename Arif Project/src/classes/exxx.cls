public class exxx {

    public Boolean inboundChecked2 { get; set; }

    public PageReference closeWindow() {
        inboundChecked2 = false;
        outboundChecked2 = true;
        return null;
    }


public Boolean outboundChecked2 { get; set; }




public exxx()
{
  outboundChecked2 = true;
}
}