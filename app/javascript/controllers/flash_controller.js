import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

// Connects to data-controller="flash"
export default class extends Controller {
  static values = {
    type: String,
    message: String,
  };

  connect() {
    // Only show alert if there's a message
    if (this.messageValue && this.messageValue.trim() !== "") {
      this.showAlert();
    }
    // Remove the element after showing to prevent re-triggering on Turbo navigation
    this.element.remove();
  }

  showAlert() {
    const isSuccess = this.typeValue === "notice";

    Swal.fire({
      text: this.messageValue,
      icon: isSuccess ? "success" : "error",
      iconColor: isSuccess ? "#20B2AA" : "#EF4444",
      showConfirmButton: false,
      timer: 2000,
      timerProgressBar: true,
      background: "#FFFFFF",
      color: "#1E293B",
      backdrop: "rgba(30, 41, 59, 0.4)",
      customClass: {
        popup: "swal-kizuna-popup",
        timerProgressBar: "swal-kizuna-progress",
      },
    });
  }
}
