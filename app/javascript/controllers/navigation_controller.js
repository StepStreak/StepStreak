import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["thisMonth", "thisMonthFrame", "summary", "summaryFrame", "challenges", "challengesFrame"]

  thisMonthFrameTargetConnected() {
      this.thisMonthTarget.classList.add('dark:text-blue-500')
  }

  thisMonthFrameTargetDisconnected() {
    this.thisMonthTarget.classList.remove('dark:text-blue-500')
  }

  summaryFrameTargetConnected() {
    console.log('summaryFrameTargetConnected')

    this.summaryTarget.classList.add('dark:text-blue-500')
  }

  summaryFrameTargetDisconnected() {
    this.summaryTarget.classList.remove('dark:text-blue-500')
  }

  challengesFrameTargetConnected() {
    console.log('challengesFrameTargetConnected')
      this.challengesTarget.classList.add('dark:text-blue-500')
  }

  challengesFrameTargetDisconnected() {
      this.challengesTarget.classList.remove('dark:text-blue-500')
  }
}
