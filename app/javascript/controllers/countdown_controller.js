import { Controller } from "@hotwired/stimulus"
import moment from 'moment-timezone';

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["countdownElement"]
  static values = { tournamentStartAt: String }

  connect() {
    let dateInUTC = moment(new Date(this.tournamentStartAtValue).getTime());

    let timeZone = moment.tz.guess();

    let dest = dateInUTC.tz(timeZone)

    const countdownElements = this.countdownElementTargets;

    let x = setInterval(function () {
      let now = new Date().getTime();
      let diff = dest - now;

      // Check if the countdown has reached zero or negative
      if (diff <= 0) {
        clearInterval(x); // Stop the countdown
        return; // Exit the function
      }

      let days = Math.floor(diff / (1000 * 60 * 60 * 24));
      let hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      let minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
      let seconds = Math.floor((diff % (1000 * 60)) / 1000);

      if (days < 10) {
        days = `0${days}`;
      }
      if (hours < 10) {
        hours = `0${hours}`;
      }
      if (minutes < 10) {
        minutes = `0${minutes}`;
      }
      if (seconds < 10) {
        seconds = `0${seconds}`;
      }

      // Loop through the elements and update their content
      for (let i = 0; i < countdownElements.length; i++) {
        let className = countdownElements[i].classList[1]; // Get the second class name
        switch (className) {
          case "days":
            countdownElements[i].innerHTML = days;
            break;
          case "hours":
            countdownElements[i].innerHTML = hours;
            break;
          case "minutes":
            countdownElements[i].innerHTML = minutes;
            break;
          case "seconds":
            countdownElements[i].innerHTML = seconds;
            break;
          default:
            break;
        }
      }
    }, 1000);
  }
}
