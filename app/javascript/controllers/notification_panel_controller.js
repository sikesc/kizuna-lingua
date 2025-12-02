import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notification-panel"
export default class extends Controller {
  static targets = ["panel", "count", "notifications"]

  toggle(event) {
    event.stopPropagation()
    this.panelTarget.classList.toggle('active')
    document.body.classList.toggle('no-scroll')
  }
}
