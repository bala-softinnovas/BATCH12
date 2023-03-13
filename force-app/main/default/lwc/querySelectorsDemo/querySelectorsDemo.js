import { LightningElement } from 'lwc';

export default class QuerySelectorsDemo extends LightningElement {

    fruits = ["Orange", "Apple", "Banana", "Grape"];

    clickHandler() {
        //querySelector demo
        const headerElem = this.template.querySelector("h1");
        console.log(headerElem.innerText);
        headerElem.style.color = 'blue';
        headerElem.style.backgroundColor = '#1bcf2a';
        headerElem.style.border = "3px solid green";

        const pElem = this.template.querySelector("p");
        console.log(pElem.innerText);
        pElem.style.color = "white";
        pElem.style.backgroundColor = "black";
        pElem.style.border = "3px solid yellow";

        //querySelectors demo
        const divElems = this.template.querySelectorAll("div.child");
        divElems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
        });
    }
}