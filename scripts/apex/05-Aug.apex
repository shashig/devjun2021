//Execute future method
System.debug('Before invoking the future method');
MyFutureMethodClass.futureCall();
System.debug('After invoking the future method');


//Start a batch jon
System.debug('Before starting the batch job');
MyBatchClass mbc = new MyBatchClass();
Id jobId = Database.executeBatch(mbc, 20);
System.debug('After starting the batch job');

//Execute Queuable method
MyQueueableClass1 mqc1 = new MyQueueableClass1('Hello World');
Id asyncJobId = System.enqueueJob(mqc1);

//Schedule job
MySchedulableClass msc = new MySchedulableClass();
String cronExpression = '0 36 13 * * ?';
Id asyncJobId = System.schedule('Schedule Try', cronExpression, msc);
