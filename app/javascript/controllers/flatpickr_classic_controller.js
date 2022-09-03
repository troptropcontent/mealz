import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';
import { French } from "flatpickr/dist/l10n/fr";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = ["dateInput"]
  connect() {
    const input = this.element
    const options = JSON.parse(input.dataset.options)
    flatpickr.localize(French)
    flatpickr(input, options)
  }
}


