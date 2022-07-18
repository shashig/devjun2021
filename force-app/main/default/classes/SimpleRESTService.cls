@RestResource(urlMapping='/Hello')
global with sharing class SimpleRESTService {
   @HttpGet
   global static String getMyHello() {
       return 'Hello Stratos Team. How are you today?. Time: ' + System.now();
   }
}
