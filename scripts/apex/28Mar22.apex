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

//APEX REST Callout
HttpRequest req = new HttpRequest();
req.setEndpoint('https://testappshashi.appspot.com/accounts');
req.setMethod('GET');
Http http = new Http();
HTTPResponse res = http.send(req);
System.debug('>>>> ' + res.getStatusCode());
System.debug('>>>> ' + res.getBody());

//SOAP Callout through Apex generated from WSDL2Apex
CalculatorServices.CalculatorImplPort calc = new CalculatorServices.CalculatorImplPort();
System.debug('20 / 3 = ' + calc.doDivide(20, 3));

//get Seesion id
String sessionId = UserInfo.getSessionId();
System.debug(sessionId.substring(0, 20));
System.debug(sessionId.substring(20));
