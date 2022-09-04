import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dropdown-menu"
export default class extends Controller {
  static targets = ["dropdownMenu"]
  connect() {
  }

  toggleMenu() {
    this.dropdownMenuTarget.classList.toggle("hidden")
  }
}
