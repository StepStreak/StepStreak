import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navigation"
export default class extends Controller {
  static targets = ["thisMonth", "thisMonthFrame", "overview", "overviewFrame", "notifications", "notificationsFrame"]

  thisMonthFrameTargetConnected() {
    this.handleFrameTargetConnected(this.thisMonthTarget);
  }

  thisMonthFrameTargetDisconnected() {
    this.handleFrameTargetDisconnected(this.thisMonthTarget);
  }

  notificationsFrameTargetConnected() {
    this.handleFrameTargetConnected(this.notificationsTarget);
  }

  notificationsFrameTargetDisconnected() {
    this.handleFrameTargetDisconnected(this.notificationsTarget);
  }

  overviewFrameTargetConnected() {
    this.handleFrameTargetConnected(this.overviewTarget);
  }

  overviewFrameTargetDisconnected() {
    this.handleFrameTargetDisconnected(this.overviewTarget);
  }

  handleFrameTargetConnected(frameTarget) {
    let svgElement = frameTarget.querySelector('svg');
    this.addSVGClassAndBackground(frameTarget, svgElement);
  }

  handleFrameTargetDisconnected(frameTarget) {
    frameTarget.classList.remove('dark:text-blue-500');
  }

  addSVGClassAndBackground(bodyElement, svgElement) {
    svgElement.classList.remove('dark:text-gray-400');
    svgElement.classList.add('dark:text-blue-500');
    bodyElement.classList.add('dark:bg-gray-800');
  }

}
