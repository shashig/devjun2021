import { LightningElement, wire } from 'lwc';
import { refreshApex } from "@salesforce/apex";

import getApexSecurityDemoRecords from '@salesforce/apex/ApexSecurityDemo.getApexSecurityDemoRecords';

export default class ApexSecurityDemoLwc extends LightningElement {
  apexSecurityDemoRecords = [];
  apexResponse;

  @wire(getApexSecurityDemoRecords)
    wiredApexSecurityDemoRecords(response) {
      this.apexResponse = response;
      console.log('ApexSecurityDemoLwc - getApexSecurityDemoRecords', response);
      if (response.data) {
        this.apexSecurityDemoRecords = response.data;
      } else if (response.error) {
        console.error(response.error);
      }
    }

  refresh() {
    refreshApex(this.apexResponse);
  }
}