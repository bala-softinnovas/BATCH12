import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import NAME_FIELD from '@salesforce/schema/Employee__c.Name';
import EMP_NAME_FIELD from '@salesforce/schema/Employee__c.Employee_Name__c';
import DESIGNATION_FIELD from '@salesforce/schema/Employee__c.Designation__c';
import GENDER_FIELD from '@salesforce/schema/Employee__c.Gender__c';
import EMAIL_FIELD from '@salesforce/schema/Employee__c.Email__c';
import USERNAME_FIELD from '@salesforce/schema/Employee__c.Username__c';
import PHONE_FIELD from '@salesforce/schema/Employee__c.Phone_Number__c';

export default class GetRecordEmployee extends LightningElement {
    recordId = "a052w00000G31kDAAR";
    employeeId;
    employeeName;
    designation;
    gender;
    email;
    userName;
    phoneNumber;

    @wire(getRecord, {recordId: '$recordId', layoutTypes: ['Full'], modes: ['View']})
    recordHandler({data, error}) {
        if(data) {
            console.log(data);
            /* Approach 1 
            this.employeeId = data.fields.Name.value;
            this.employeeName = data.fields.Employee_Name__c.value;
            this.designation = data.fields.Designation__c.value;
            this.gender = data.fields.Gender__c.displayValue;
            this.email = data.fields.Email__c.value;
            this.userName = data.fields.Username__c.value;
            this.phoneNumber = data.fields.Phone_Number__c.value;
            */

            /* Approach 2 */
            this.employeeId = getFieldValue(data, NAME_FIELD);
            this.employeeName = getFieldValue(data, EMP_NAME_FIELD);
            this.designation = getFieldValue(data, DESIGNATION_FIELD);
            this.gender = getFieldDisplayValue(data, GENDER_FIELD);
            this.email = getFieldValue(data, EMAIL_FIELD);
            this.userName = getFieldValue(data, USERNAME_FIELD);
            this.phoneNumber = getFieldValue(data, PHONE_FIELD);
        }
        if(error) {
            console.error(error);
        }
    }
}