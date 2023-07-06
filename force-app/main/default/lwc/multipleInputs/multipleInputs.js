import { LightningElement, track } from 'lwc';

export default class MultipleInputs extends LightningElement {
  @track inputCounts = []; //In format {key: , value: , id: }

  addCount() {
    const newInputs = [...this.inputCounts];
    const currLength = this.inputCounts.length;
    newInputs.push({key: currLength, value: 0, id: currLength});
    this.inputCounts = newInputs;
  }

  inputChange(e) {
    const inputIdx = e.target.getAttribute('data-input-id');
    this.inputCounts[inputIdx].value = e.target.value;
    
    const countValues = this.inputCounts.map(count => count.value);
    console.log(JSON.stringify(this.inputCounts));
  }

  getAllValues() {
    const inputs = this.template.querySelectorAll("lightning-input");
    inputs.forEach(input => {
      console.log(input.value);
    })
  }
}