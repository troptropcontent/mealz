import { Controller } from "@hotwired/stimulus"
import flatpickr from 'flatpickr';
import { French } from "flatpickr/dist/l10n/fr";
// Connects to data-controller="flatpickr"
export default class extends Controller {
  static targets = [ "startOnInput", "endOnInput", "datesInput"]
  connect() {
    const updateInputs = (selectedDates, dateStr, instance) => {
      this.startOnInputTarget.value = selectedDates[0]
      this.endOnInputTarget.value = selectedDates[1]
    }

    flatpickr.localize(French)
    flatpickr(this.datesInputTarget, {mode: "range", onClose: [updateInputs], minDate: Date.now()})
  }
}


