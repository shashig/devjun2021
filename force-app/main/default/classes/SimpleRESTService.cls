@RestResource(urlMapping='/Hello')
global with sharing class SimpleRESTService {
   @HttpGet
   global static String getHello() {
       return 'Hello World';
   }
}
