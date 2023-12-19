import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["thisMonth", "thisMonthFrame", "overview", "overviewFrame"]

  thisMonthFrameTargetConnected() {
      this.thisMonthTarget.classList.add('dark:text-blue-500')
  }

  thisMonthFrameTargetDisconnected() {
    this.thisMonthTarget.classList.remove('dark:text-blue-500')
  }

  overviewFrameTargetConnected() {
    this.overviewTarget.classList.add('dark:text-blue-500')
  }

  overviewFrameTargetDisconnected() {
    this.overviewTarget.classList.remove('dark:text-blue-500')
  }
}
