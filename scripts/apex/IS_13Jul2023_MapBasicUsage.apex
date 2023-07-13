List<String> customers = new List<String>{'Harish', 'Harish', 'Rahul', 'Rahul', 'Rahul', 'CP', 'CP', 'CP'};
List<Integer> purchases = new List<Integer>{1, 2, 3, 4, 5, 6, 7, 8};
System.debug(customers);
//Harish: 3
//Rahul: 12
//CP: 21

Map<String, Integer> customerPurchases = new Map<String, Integer>();
for (Integer i = 0; i < customers.size(); i++) {
  String customer = customers[i]; //or customers.get(i);
  Boolean exists = customerPurchases.containsKey(customer);
  if (exists) {
    Integer currentSum = customerPurchases.get(customer);
    Integer newSum = currentSum + purchases.get(i);
    customerPurchases.put(customer, newSum);
    //customerPurchase.put(customer, purchases.get(i) + customerPurchases.get(customer));
  } else {
    customerPurchases.put(customer, purchases.get(i));
  }
}

for (String customer : customerPurchases.keySet()) {
  System.debug('>>>> Name: ' + customer + ': ' + customerPurchases.get(customer));
}
System.assertEquals(21, customerPurchases.get('CP'));
System.assertEquals(12, customerPurchases.get('Rahul'));
System.assertEquals(3, customerPurchases.get('Harish'));