Account newAccount = new Account(name = 'Stratos Cohort-4 Batch-4');
Account newAccount1 = new Account(name = 'Stratos Cohort-4 Batch-4');
List<Account> accountsToInsert = new List<Account>();
accountsToInsert.add(newAccount);
accountsToInsert.add(newAccount1);
insert (accountsToInsert);

List<Account> accounts = [select id, name, CreatedDate 
                            from Account 
                          order by CreatedDate desc];

for (Account acct : accounts) {
    System.debug('>>> ' + acct.Name + ', Created Date: ' + acct.CreatedDate);
}