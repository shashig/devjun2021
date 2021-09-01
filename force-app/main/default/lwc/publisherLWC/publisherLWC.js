import { LightningElement, wire } from 'lwc';
// Import message service features required for publishing and the message channel
import { publish, MessageContext } from 'lightning/messageService';
import SIMPLE_MESSAGE_CHANNEL from '@salesforce/messageChannel/SimpleMessage__c';

export default class PublisherLWC extends LightningElement {
    @wire(MessageContext) messageContext

    publishMessage() {
        console.log('Came to publishMessage in publisherLWC');
        const payload = {textMessage: new Date()}

        publish(this.messageContext, SIMPLE_MESSAGE_CHANNEL, payload)
    }
}