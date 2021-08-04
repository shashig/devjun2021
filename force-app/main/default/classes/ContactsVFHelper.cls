public class ContactsVFHelper {
    public static List<Contact> getContacts() {
        return ([select id, name, email from Contact]);
    }
}
