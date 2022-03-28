//Future Method
System.debug('Calling non future method');
MyFutureMethodClass.nonFutureCall();
System.debug('Calling future method');
MyFutureMethodClass.futureCall();

//Batch Class
MyBatchClass mbc = new MyBatchClass();
Id batchId = Database.executeBatch(mbc, 10);

//Queueable class
MyQueueableClass1 mqc = new MyQueueableClass1('Hello Stratos Team');
System.enqueueJob(mqc);

//Schedule 

MySchedulableClass msc = new MySchedulableClass();
String sch = '0 11 10 ? * * *';
String jobID = system.schedule('My Sample Job', sch, msc);