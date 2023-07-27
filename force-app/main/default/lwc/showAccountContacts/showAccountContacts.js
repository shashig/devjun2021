import { LightningElement, api } from 'lwc';

const columns = [
  { label: 'Name', fieldName: 'Name' },
  { label: 'Email', fieldName: 'Email' },
]

export default class ShowAccountContacts extends LightningElement {
  @api
  accountContacts = [];
  columns = columns;



  get numberOfContacts() {
    return this.accountContacts.length;
  }
}