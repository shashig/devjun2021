//Future Method Call
/*
System.debug('Calling nonFutureCall method');
MyFutureMethodClass.nonFutureCall();

System.debug('Calling futureCall method');
MyFutureMethodClass.futureCall();
*/

//Batch class
/*
System.debug('Executing batch process');
MyBatchClass mbc = new MyBatchClass();
Database.executeBatch(mbc, 30);
*/

//Queueable class
System.debug('Enqueing Queueable Apex job');
MyQueueableClass1 mqc = new MyQueueableClass1('Hello Stratos Team');
System.enqueueJob(mqc);