import { LightningElement } from 'lwc';

export default class SendToLWC_v3 extends LightningElement {
    messageFromVF;
    
  connectedCallback() {
    var VfOrigin =
      "https://adovys-f-dev-ed--c.vf.force.com/apex/SampleVFtoLWC";
    window.addEventListener("message", (message) => {
    //   if (message.origin !== VfOrigin) {
    //     //Not the expected origin
    //     return;
    //   }

      //handle the message
    //   if (message.data.name === "SampleVFToLWCMessage") {
        this.messageFromVF = JSON.parse(JSON.stringify(message.data));

        
    //   }
    });
  }
}