import { LightningElement } from 'lwc';

export default class ConditionalRendering2 extends LightningElement {
    showContent = false;

    clickHandler() {
        this.showContent = !this.showContent;
    }
}