import { LightningElement } from 'lwc';

export default class SimpleLWC extends LightningElement {
    name = 'Stratos'

    connectedCallback() {
        console.log('came into connectedCallback')
    }
}