public class QueueableExample2 implements Queueable {
 
    public void execute(QueueableContext context) {
               System.enqueueJob(new QueueableExample3()); 
               System.enqueueJob(new QueueableExample()); 
    }
}