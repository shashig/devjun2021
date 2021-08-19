@isTest
public class CoverageDemoTest {
    @TestSetup
    static void makeData(){
        Account a = new Account(Name='Sample Account');
        insert (a);
        a = new Account(Name='Another Account');
        insert (a);

        for (Integer i = 0; i < 40; i++) {
            a = new Account(Name='Another Account' + i);
            insert (a);
        }
    }
   @isTest
   public static void testGetAllAccounts() {
       Test.startTest();
       List<Account> accounts = CoverageDemo.getAccounts(null);
       Test.stopTest();

       System.assertEquals(42, accounts.size());
       System.debug('>>>>> Number of accounts: ' + accounts.size());
   }

   @isTest
   public static void testAccountsWithNamePattern() {
       Test.startTest();
       String pattern = 'Not Found';
       List<Account> accounts1 = CoverageDemo.getAccounts(pattern);

       pattern = 'Sample';
       List<Account> accounts2 = CoverageDemo.getAccounts(pattern);
       Test.stopTest();

       System.assertEquals(0, accounts1.size());
       System.assertEquals(1, accounts2.size());
   }
}
