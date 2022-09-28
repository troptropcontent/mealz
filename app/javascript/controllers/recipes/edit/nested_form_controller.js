import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipes--edit--nested-form"
export default class extends Controller {
  static targets = [ "template", "target", "newRecipeIngredient", "newRecipeQuantity" ]
  connect() {
  }
  addRecipe(event) {
    event.preventDefault()
    let selectedOption = this.newRecipeIngredientTarget.selectedOptions[0]
    let ingredientName = selectedOption.text
    let recipeIngredientId = selectedOption.value
    let recipeQuantity = this.newRecipeQuantityTarget.value
    let  mapping = {
      'INGREDIENT_NAME': ingredientName,
      'INGREDIENT_UNIT': '',
      'INGREDIENT_ID': recipeIngredientId,
      'QUANTITY': recipeQuantity,
      'NEW_RECORD': new Date().valueOf(),
    }
    let regex = new RegExp(Object.keys(mapping).join('|'), 'g')
    let mapMatch = match => mapping[match]
    if (recipeQuantity && recipeIngredientId) {
      console.log(mapping)
      let content = this.templateTarget.innerHTML.replace(regex, mapMatch)
      this.targetTarget.insertAdjacentHTML('beforebegin', content)
    }
  }


}
