import { LightningElement } from 'lwc';

export default class ArrayDisplayIssue extends LightningElement {
    employees;
    empCount;
    guides = [{"name": "Abhijith"}, {"name": "Sanjay"}]
    connectedCallback() {
        console.log('Came to connectedCallback');
    }
    renderedCallback() {
        console.log('Came to renderedCallback');
    }
    showEmployees(event) {
        event.preventDefault();
        //console.log(JSON.stringify(event.currentTarget))
        const guideName = event.currentTarget.textContent;
        console.log(guideName)
        if (guideName === "Abhijith") {
            this.employees = [{"name": "Shashi"}, {"name": "Dinesh"}, {"name": "Manasa"}];
        } else {
            this.employees = [{"name": "Veena"}, {"name": "Aditya"}];
        }
        this.empCount = this.employees.length
        console.log('>>> Employee Count: ' + this.empCount);
    }

    showGuides(event) {
        event.preventDefault();
        this.employees = undefined;
    }
}