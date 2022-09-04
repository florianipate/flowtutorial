import { LightningElement, api } from 'lwc';

import {
    FlowAttributeChangeEvent,
    FlowNavigationNextEvent,
    FlowNavigationBackEvent,
    FlowNavigationPauseEvent,
    lowNavigationFinishEvent
} from 'lightning/flowSupport';

export default class RichTextAteaLWC extends LightningElement {
    @api placeholder;
    @api required;
    @api value;
    @api label;
    requiredMessage = 'Value is required for this field';
    _validity = true;

    handleChange = (event) =>{
        event.preventDefault();
        event.value = event.target.value;

    }

    @api
    validate(){
        if(this.validateInput()){
            return{
                isValid: true
            };
        } else {
            return{
                isValid: false,
                errorMessage: this.requiredMessage
            };
        }

    }
    
    validateInput(){
        if(!this.value){
            this._validity = false;
        } else{
            this._validity = true;
        }
        return this._validity;
    }
}