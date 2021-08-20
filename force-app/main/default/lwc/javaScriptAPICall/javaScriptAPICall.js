import { LightningElement } from 'lwc';
/*
A simple LWC demonstrating how API calls can be made directly from JavaScript
Do add the API server in CSP Trusted Sites on Setup to whitelist the call
*/
export default class JavaScriptAPICall extends LightningElement {
    countriesInfo
    countries
    error
    
    connectedCallback() {
        this.getCountries()
    }

    getCountries() {
        fetch('https://api.worldbank.org/v2/country?format=json&page=3', {
            method: "GET",
            headers: {
                "Accept": "application/json"
              }
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            } 
        })
        .then(responseJSON => {
            this.countriesInfo = responseJSON[0];
            this.countries = responseJSON[1];
            console.log(JSON.stringify(this.countriesInfo));
            console.log(JSON.stringify(this.countries));
        })
        .catch(error => {
            this.error = JSON.stringify(error)
        })
    }
}