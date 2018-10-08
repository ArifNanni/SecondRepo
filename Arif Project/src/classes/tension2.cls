public class tension2 {

    public tension2(ApexPages.StandardController controller) {
       System.debug('-=========apex pages');
    }


    public tension2(tension1 controller) {
         System.debug('extension'+controller.fg);
    }

}