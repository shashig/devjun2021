import { LightningElement } from 'lwc';

export default class ArrayDisplayIssue extends LightningElement {
    employees;
    guides = [{"name": "Abhijith"}, {"name": "Sanjay"}]

    showEmployees(event) {
        console.log(JSON.stringify(event.currentTarget))
        const guideName = event.currentTarget.textContent;
        console.log(guideName)
        if (guideName === "Abhijith") {
            this.employees = [{"name": "Shashi"}, {"name": "Dinesh"}, {"name": "Manasa"}];
        } else {
            this.employees = [{"name": "Veena"}, {"name": "Aditya"}, {"name": "Sheela"}];
        }
    }

    showGuides() {
        this.employees = undefined;
    }
}