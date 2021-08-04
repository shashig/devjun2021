public inherited sharing class ContactsVFContoller {
  public List<Contact> contacts {get; set;}
  public Integer contactsCount {get; set;}
  
  public ContactsVFContoller() {
      contacts = ContactsVFHelper.getContacts();
      contactsCount = contacts.size();
  }
}