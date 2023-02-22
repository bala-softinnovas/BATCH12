import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    accounts = [
        {
            Name: "Soft Innovas",
            Type: "Existing Customer",
            Industry: "Education"
        }, 
        {
            Name: "SF Academy",
            Type: "New Customer",
            Industry: "Education"
        }, 
        {
            Name: "Universal Containers",
            Type: "Existing Customer",
            Industry: "Information Technology"
        }
    ];
}