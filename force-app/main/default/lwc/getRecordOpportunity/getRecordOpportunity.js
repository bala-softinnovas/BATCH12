import { getRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';

import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.Account.Name';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

const FIELDS = [ACCOUNT_FIELD, NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, CLOSEDATE_FIELD];

export default class GetRecordOpportunity extends LightningElement {

    recordId = "0062w00000I9ccvAAB";
    accountName;
    oppName;
    type;
    stage;
    amount;
    closeDate;

    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}) {
        if(data) {
            console.log(data);
            this.accountName = data.fields.Account.displayValue;
            this.oppName = data.fields.Name.value;
            this.type = data.fields.Type.value;
            this.stage = data.fields.StageName.value;
            this.amount = data.fields.Amount.displayValue;
            this.closeDate = data.fields.CloseDate.displayValue;
        }
        if(error) {
            console.error(error);
        }
    }
}