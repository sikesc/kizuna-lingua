import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["panel", "overlay", "notifications"]

  connect() {
    this.isOpen = false
  }

  toggle(event) {
    event.preventDefault()
    event.stopPropagation()

    if (!this.hasPanelTarget || !this.hasOverlayTarget) {
      return
    }

    this.isOpen = !this.isOpen

    if (this.isOpen) {
      this.panelTarget.style.right = "0"
      this.overlayTarget.style.opacity = "1"
      this.overlayTarget.style.visibility = "visible"
      document.body.classList.add("no-scroll")
    } else {
      this.panelTarget.style.right = "-100%"
      this.overlayTarget.style.opacity = "0"
      this.overlayTarget.style.visibility = "hidden"
      document.body.classList.remove("no-scroll")
    }
  }
}
