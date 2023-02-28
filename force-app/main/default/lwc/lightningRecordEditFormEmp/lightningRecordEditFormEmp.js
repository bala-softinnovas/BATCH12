import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import EMP_OBJECT from '@salesforce/schema/Employee__c';
import EMPLOYEE_NAME_FIELD from '@salesforce/schema/Employee__c.Employee_Name__c';
import DESIGNATION_FIELD from '@salesforce/schema/Employee__c.Designation__c';
import EMAIL_FIELD from '@salesforce/schema/Employee__c.Email__c';
import USERNAME_FIELD from '@salesforce/schema/Employee__c.Username__c';
import PHONE_FIELD from '@salesforce/schema/Employee__c.Phone_Number__c';
import GENDER_FIELD from '@salesforce/schema/Employee__c.Gender__c';

export default class LightningRecordEditFormEmp extends LightningElement {
    objectName = EMP_OBJECT;
    fields = {
        employeeName: EMPLOYEE_NAME_FIELD,
        designation: DESIGNATION_FIELD,
        email: EMAIL_FIELD,
        username: USERNAME_FIELD,
        phone: PHONE_FIELD,
        gender: GENDER_FIELD
    };

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Employee record has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }
}