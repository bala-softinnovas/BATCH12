import { LightningElement } from 'lwc';
import EMP_OBJECT from '@salesforce/schema/Employee__c';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordBlog extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }

    saveEmployee() {
        const recordInput = {
            apiName: EMP_OBJECT.objectApiName,
            fields: this.formdata
        };
        createRecord(recordInput)
            .then(result => {
                const successToast = new ShowToastEvent({
                    title: "Success",
                    message: "Employee record has been created successfully!",
                    variant: "success"
                });
                this.dispatchEvent(successToast);
            })
            .catch(error => {
                //show error toast
                console.error(error);

                const successToast = new ShowToastEvent({
                    title: "Error",
                    message: error.body.message,
                    variant: "error"
                });
                this.dispatchEvent(successToast);
            })
    }

    cancelEmployee() {
        this.template.querySelector("form.empform").reset();
        this.formdata = {};
    }
}