import getTopOpportunities from '@salesforce/apex/OpportunityCtrl.getTopOpportunities';
import { LightningElement, wire } from 'lwc';

export default class WiredApex2 extends LightningElement {
    stageName = "Closed Won";

    @wire(getTopOpportunities, {stage: '$stageName'})
    opps;
}