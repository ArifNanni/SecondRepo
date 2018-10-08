public class XMLparse{
    /**
     * Webkul Software.
     *
     * @category  Webkul
     * @author    Webkul
     * @copyright Copyright (c) 2010-2017 Webkul Software Private Limited (https://webkul.com)
     * @license   https://store.webkul.com/license.html
     **/
    string XMLString;
    public list<product2> pro;
    product2 temppro;
    
    public XMLparse(){
        pro = new list<product2 >();
        XMLString = '<?xml version="1.0" encoding="UTF-8"?><products><product><name>Xbox</name><code>XBO</code></product><product><name>Playstation</name><code>PS</code></product><product><name>Wii</name></product></products>';
        DOM.Document doc=new DOM.Document();
        try{
            System.debug('++1compstring'+XMLString);
            doc.load(XMLString);
            
            DOM.XmlNode rootNode=doc.getRootElement();
            System.debug('++2compstring'+doc.getRootElement());
            System.debug('++2compstring'+rootNode);
            
            parseXML(rootNode);
            pro.add(temppro);
            insert pro;
        }catch(exception e){
            system.debug(e.getMessage());
        }
    }
    
    private void parseXML(DOM.XMLNode node) {
     System.debug('++3compstring'+node);
     System.debug('++4compstring'+node.getNodeType());
     System.debug('++5compstring'+DOM.XMLNodeType.ELEMENT);
     System.debug('++6'+node.getName());
        if (node.getNodeType() == DOM.XMLNodeType.ELEMENT) {
        system.debug(node.getName());
            if(node.getName()=='product'){
                if(temppro!=null)
                    pro.add(temppro);
                temppro = new product2();
                SYstem.debug('++7'+node.getText().trim());
            }
            if(node.getName()=='name')
                temppro.name=node.getText().trim();
            if(node.getName()=='code')
                temppro.productcode=node.getText().trim();
        }
        System.debug('++8'+node.getChildElements());
        for (Dom.XMLNode child: node.getChildElements()) {
            parseXML(child);
        }
    }
}