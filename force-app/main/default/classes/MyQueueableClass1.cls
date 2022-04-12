public class MyQueueableClass1 implements Queueable {
    String message;

    public MyQueueableClass1(String message) {
        this.message = message;
    }

    public void execute(QueueableContext qc) {
        System.debug('Came into MyQueueableClass1.execute() @ ' + System.now() + '. message: ' + message);

        //To see the error caused by recursive call, comment out the conditional
         //if (message == 'Hello Stratos Team') {
             MyQueueableClass1 mqc1 = new MyQueueableClass1('Hello World');
             Id asyncJobId = System.enqueueJob(mqc1);
         //} 
    }
}
