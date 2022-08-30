import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="course"
export default class extends Controller {
  static targets = [ "option", "unit", "quantity"]
  update_ingredient_unit(event) {
    const ingredientName = event.target.value
    const options = this.optionTargets
    const option = options.filter((option)=> option.value == ingredientName)[0]
    if (option)
      {
        this.unitTarget.value = option.innerText
        this.unitTarget.disabled   = true
        this.quantityTarget.disabled   = false
      }
    else if (ingredientName.length > 0)
      {
        this.unitTarget.value = this.unitTarget[0].value
        this.unitTarget.disabled   = false
        this.quantityTarget.disabled   = false  
      }
    else
    {
      this.unitTarget.disabled   = true
      this.quantityTarget.disabled   = true  
    }
  }
}

