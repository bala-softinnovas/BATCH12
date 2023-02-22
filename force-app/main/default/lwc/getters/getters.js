import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {
    users = ["Smith", "Mike", "Sachin"];
    num1 = 10;
    num2 = 20;

    get multiply() {
        return this.num1*this.num2;
    }

    get firstUser() {
        return this.users[0];
    }
}