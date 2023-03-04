import { LightningElement } from 'lwc';

export default class CreateRecordBlog extends LightningElement {
    formdata = {};

    changeHandler(event) {
        const {name, value} = event.target;
        this.formdata[name] = value;
    }
}