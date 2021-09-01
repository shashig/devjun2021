import { LightningElement, wire } from 'lwc';

// Import message service features required for subscribing and the message channel
import { subscribe, MessageContext } from 'lightning/messageService';
import SIMPLE_MESSAGE_CHANNEL from '@salesforce/messageChannel/SimpleMessage__c';

export default class SubscriberLWC extends LightningElement {
    @wire(MessageContext) messageContext
    receivedMessage

    // Encapsulate logic for LMS subscribe.
    subscribeToMessageChannel() {
        this.subscription = subscribe(
            this.messageContext,
            SIMPLE_MESSAGE_CHANNEL,
            (message) => this.handleMessage(message)
        );
    }

    // Handler for message received by component
    handleMessage(message) {
        console.log('Came to handleMessage in SubscriberLWC. Message: ' + message.textMessage);
        this.receivedMessage = message.textMessage;
    }

    // Standard lifecycle hooks used to sub/unsub to message channel
    connectedCallback() {
        this.subscribeToMessageChannel();
    }
}