import { LightningElement, api, wire } from 'lwc';
import getAccount from '@salesforce/apex/ContactsController.getAccount';

export default class ShowAccounts extends LightningElement {
  @api
  recordId;

  accountName = 'Click to get info'
  contacts = [];

  @wire(getAccount, {accountId: '$recordId'}) 
    wiredGetAccounts(accountsInfo) {
      console.log(accountsInfo);
      if (accountsInfo.data) {
        this.accountName = accountsInfo.data.Name;
        this.contacts = accountsInfo.data.Contacts;
      } else if (accountsInfo.error) {
        console.error(accountsInfo.error);
      }
    }

  //Execute functionality when component is inserted into DOM
  // connectedCallback() {
  //   this.getAccountJS();
  // }

  getAccountJS() {
    getAccount({accountId: this.recordId})
      .then(res => {
        console.log(res);
        this.accountName = res.Name;
        this.contacts = res.Contacts;
      })
      .catch(err => {
        console.error(err);
      })
  }
}