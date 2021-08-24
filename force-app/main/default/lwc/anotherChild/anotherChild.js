import { LightningElement, api, track } from 'lwc';

export default class AnotherChild extends LightningElement {
    @api message = 'Static message in JS file'
    @api recordId
    @track myArray = [1, 2, 3, 4]
    @track myObject = {'name' : 'HFS', 'location': 'Bangalore'}
    myNumber = 20;

    clickHandler(event) {
        console.log(event.target.label);
        if (event.target.label === 'Change Object') {
            this.myObject = {'name' : 'Techila', 'location': 'Pune'}
        } else if (event.target.label === 'Change Array') {
            this.myArray = [9, 8, 7, 6]
        } else if (event.target.label === 'Change Object Field Value') {
            this.myObject.name = 'Techila'
            console.log(JSON.stringify(this.myObject))
        } else if (event.target.label === 'Add Item to Array') {
            this.myArray.push(9);
            console.log(JSON.stringify(this.myArray))
        }
    } 
}