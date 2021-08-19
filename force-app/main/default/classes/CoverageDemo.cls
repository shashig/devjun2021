public with sharing class CoverageDemo {
    public static List<Account> getAccounts(String pattern) {
        if (pattern == null) {
            List<Account> accounts = [select id, name from Account];
            
            System.debug('>>> number of accounts: ' + accounts.size());
            //just to show unexecuted lines of code
            if (accounts.size() > 20) {
                System.debug('>>> too many accounts'); 
                Contact c = new Contact(LastName = 'HFS');
                insert(c);
            }
            return (accounts);
        } else {
            String searchTerm = '%' + pattern + '%';
            List<Account> accounts = [select id, name 
                                        from Account 
                                       where name like :searchTerm];

            return (accounts);
        }
    }
 }
