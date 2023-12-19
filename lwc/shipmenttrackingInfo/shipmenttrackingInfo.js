import { LightningElement, track,api,wire } from 'lwc';
import getOrderTrackingNumber from '@salesforce/apex/CaseController.getOrderTrackingNumber';

export default class ShipmenttrackingInfo extends LightningElement {
    @api recordId; 
    @track trackingStatus;
    @track errorMessage;

    // Use the @wire decorator to call the Apex method and pass the record ID as an argument
    
    connectedCallback(){
        getOrderTrackingNumber({recordId: this.recordId})
            .then(result => {
                this.trackingStatus = result;
                
            })
            .catch(error => {
                this.errorMessage = error;
                
            });

            
    }
    
}