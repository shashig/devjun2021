import { LightningElement, wire, api } from 'lwc';
import getContactsJs from '@salesforce/apex/ContactsController.getContacts'
import getContactJs from '@salesforce/apex/ContactsController.getContact'

export default class ShowContactsLwc extends LightningElement {
    contacts
    searchResults
    searchParm = 'Shashi'
    @api recordId = '0035g000008lqAnAAI'
    
    @wire(getContactsJs) wiredContacts

    @wire(getContactJs, {'contactId' : '$recordId'}) singleContact

    handleClick() {
        console.log('came to handleClick')
        this.getContactsFromSalesforce()
    }

    connectedCallback() {
        console.log('In connectedCallback')
        this.searchContacts();
    }

    async getContactsFromSalesforce() {
        getContactsJs()
        .then(response => {
            this.contacts = response;
        })
        .catch(error => {
            console.log(JSON.stringify(error));
        });
    }


    searchContacts() {
        //First check if contacts are loaded. If no, then wait for the load to complete
        if (!this.contacts) {
            //Anonymous Async function as await can't be used in regular functions
            //Reference: https://javascript.info/async-await
            (async() => {
                this.contacts = await getContactsJs(); //Call Apex to get all contacts
                console.log(this.contacts.length)
                this.filterContacts() //Call JS filter method
            })();
        } else {
            this.filterContacts()
        }
    }

    filterContacts() {
        //Filter on the contacts
        let searchResults = this.contacts.filter(contact => {
            console.log(JSON.stringify(contact))
            return (contact.Name.includes(this.searchParm))
        })
        console.log(JSON.stringify(searchResults))
    }
}