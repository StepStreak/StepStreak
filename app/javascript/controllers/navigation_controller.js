import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["thisMonth", "thisMonthFrame", "overview", "overviewFrame"]

  thisMonthFrameTargetConnected() {
    let svgElement = this.thisMonthTarget.querySelector('svg');
    svgElement.classList.remove('dark:text-gray-400');
    svgElement.classList.add('dark:text-blue-500');
    this.thisMonthTarget.classList.add('dark:bg-gray-800')
  }

  thisMonthFrameTargetDisconnected() {
    this.thisMonthTarget.classList.remove('dark:text-blue-500')
  }

  overviewFrameTargetConnected() {
    let svgElement = this.overviewTarget.querySelector('svg');
    svgElement.classList.remove('dark:text-gray-400');
    svgElement.classList.add('dark:text-blue-500');
    this.overviewTarget.classList.add('dark:bg-gray-800')
  }

  overviewFrameTargetDisconnected() {
    this.overviewTarget.classList.remove('dark:text-blue-500')
  }
}
