import { Controller } from "@hotwired/stimulus"
import moment from 'moment-timezone';

export default class extends Controller {
    static targets = ["serverSyncTime", "clientSyncTime"]
    static values = { label: String }

    connect() {
        let time = this.serverSyncTimeTarget.textContent;
        let dateInUTC = moment(time);

        let timeZone = moment.tz.guess();

        this.clientSyncTimeTarget.textContent = this.labelValue + dateInUTC.tz(timeZone).format('MMM Do, HH:mm z');
    }
}