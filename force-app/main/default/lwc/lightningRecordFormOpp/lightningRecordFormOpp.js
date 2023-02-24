import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

export default class LightningRecordFormOpp extends LightningElement {
    recordId = "0062w00000JZx7qAAD";
    objectName = OPP_OBJECT;
    fields = [ACCOUNT_FIELD, NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, CLOSEDATE_FIELD];

    successHandler() {
        const successToast = new ShowToastEvent({
            title: "Success",
            message: "Opportunity has saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(successToast);
    }
}