import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="expandable-card"
export default class extends Controller {
  static targets = [ "expandable", "chevronUp", "chevronDown" ]
  connect() {
  }

  toggleExpandable() {
    this.expandableTarget.classList.toggle("hidden")
    this.chevronUpTarget.classList.toggle("hidden")
    this.chevronDownTarget.classList.toggle("hidden")
  }
}
