import { Controller } from "@hotwired/stimulus"
import moment from 'moment-timezone';

export default class extends Controller {
    static targets = ["serverSyncTime", "clientSyncTime"]

    connect() {
        let time = this.serverSyncTimeTarget.textContent;
        let dateInUTC = moment(time);

        let timeZone = moment.tz.guess();
        console.log(timeZone);

        this.clientSyncTimeTarget.textContent = "Last synced: " + dateInUTC.tz(timeZone).format('MMMM Do YYYY, h:mm:ss a');
    }
}