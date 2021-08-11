import { LightningElement, api, track } from 'lwc';
let index = 0;
export default class ChildLWC extends LightningElement {
    childMessage = 'Message from the child'
    @api message = 'placeholder for message from the enclosing parent'

    stringProperty = 'Original String'
    @track arrayProperty = [1, 2, 3, 4]
    @track objectProperty = {'Name': 'HFS', 'City': 'Bengaluru'}

    handleClick(event) {
        console.log(event.target.label);
        if (event.target.label === "Change String Value") {
            this.stringProperty = 'New Value'
        } else if (event.target.label === "Change Array Value") {
            this.arrayProperty = ['a', 'b', 'c']
        } else if (event.target.label === "Change Object Value") {
            this.objectProperty = {'Name': 'Salesforce', 'City': 'San Francisco'}
        } else if (event.target.label === "Add New Item to Array") {
            this.arrayProperty.push('a' + index++);
            console.log(JSON.stringify(this.arrayProperty));
        } else if (event.target.label === "Change Object City") {
            this.objectProperty.City = 'Mysore'
        }
    }
}