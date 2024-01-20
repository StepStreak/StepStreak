import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reload"
export default class extends Controller {
    static targets = ["serverSyncTime", "clientSyncTime"]

    connect() {
        let time = this.serverSyncTimeTarget.textContent;
        let dateInUTC = new Date(time + ' UTC');

        let timeZone = Intl.DateTimeFormat().resolvedOptions().timeZone;
        let options = {
            timeZone: timeZone,
            day: '2-digit',
            month: 'long',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };

        let timeInTimeZone = dateInUTC.toLocaleString("en-US", options);

        this.clientSyncTimeTarget.textContent = "Last synced: " + timeInTimeZone + "";
    }
}
