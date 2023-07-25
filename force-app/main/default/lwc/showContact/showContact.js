import { LightningElement, api } from 'lwc';
import getContact from '@salesforce/apex/ContactsController.getContact';

export default class ShowContact extends LightningElement {
  @api 
  recordId = '0035g00000jBzKGAA0';
  
  name;
  email

  handleClick() {
    console.log('Came into handleClick');
    // this.name = 'Marc Benioff';
    // this.email = 'mbenioff@salesforce.com';
    getContact({ contactId: this.recordId })
      .then(response => {
        console.log(response);
        this.name = response.Name;
        this.email = response.Email;
      })
      .catch(error => {
        console.log(error);
      })

    console.log('End of handleClick method');
  }

  reset() {
    console.log('Came into reset');
    this.name = '';
    this.email = '';
  }
}