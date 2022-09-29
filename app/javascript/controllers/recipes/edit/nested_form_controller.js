import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recipes--edit--nested-form"
export default class extends Controller {
  static targets = [ "templateRecipeForm","templateOption", "target", "newRecipeIngredient", "newRecipeQuantity" ]
  connect() {
  }
  addRecipe(event) {
    event.preventDefault()
    let selectedOption = this.newRecipeIngredientTarget.selectedOptions[0]
    let ingredientName = selectedOption.text
    let ingredientUnit = selectedOption.dataset['ingredientUnit']
    let recipeIngredientId = selectedOption.value
    let recipeQuantity = this.newRecipeQuantityTarget.value
    let  mapping = {
      'INGREDIENT_NAME': ingredientName,
      'INGREDIENT_UNIT': ingredientUnit,
      'INGREDIENT_ID': recipeIngredientId,
      'QUANTITY': recipeQuantity,
      'NEW_RECORD': new Date().valueOf(),
    }
    if (recipeQuantity && recipeIngredientId) {
      this.useTemplate(this.templateRecipeFormTarget, mapping, this.targetTarget, 'beforebegin')
      this.removeOption(this.newRecipeIngredientTarget, selectedOption)
      this.resetFakeForm()
    }
  }

  removeRecipe(event) {
    event.preventDefault()
    let {ingredient_id, ingredient_unit, ingredient_name} = event.params.optionData
    this.addOption(ingredient_name, ingredient_unit, ingredient_id)
    event.target.closest('.recipe-fields').remove()
  }

  removeOption(select, option) {
    select.removeChild(option);
  }

  resetFakeForm(){
    this.newRecipeIngredientTarget.value = ''
    this.newRecipeQuantityTarget.value = ''
  }

  addOption(ingredient_name, ingredient_unit, ingredient_id) {
    let  mapping = {
      'INGREDIENT_NAME': ingredient_name,
      'INGREDIENT_UNIT': ingredient_unit,
      'INGREDIENT_ID': ingredient_id,
    }
    this.useTemplate(this.templateOptionTarget, mapping, this.newRecipeIngredientTarget, 'beforeend')
  }

  useTemplate(template, mapping, target, position) {
    let regex = new RegExp(Object.keys(mapping).join('|'), 'g')
    let mapMatch = match => mapping[match]
    let content = template.innerHTML.replace(regex, mapMatch)
    target.insertAdjacentHTML(position, content)
  }
}
