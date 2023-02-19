import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    age = 30;
    fullname = "Salesforce Developer";
    location = {
        city: "Houston",
        country: "United States",
        postalCode: "50003"
    };
    fruits = ["Orange", "Banana", "Apple"];
}