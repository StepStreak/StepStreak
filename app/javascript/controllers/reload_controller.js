import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reload"
export default class extends Controller {
  connect() {
    document.getElementById('dashboard').reload();
  }
}
