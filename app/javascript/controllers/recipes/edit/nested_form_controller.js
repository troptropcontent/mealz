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
    this.reorderOption(this.newRecipeIngredientTarget)
  }

  reorderOption(select){
    let options = Array.from(select.options)
    let findOptionIndexWithValue = (options, value) => {
      return options.findIndex(option => option.value === value)
    }
    let removeAllChildNodes = (parent) => {
      while (parent.firstChild) {
          parent.removeChild(parent.firstChild);
      }
    }
    let firstElementCurrentIndex = findOptionIndexWithValue(options, '')
    let firstElement = options[firstElementCurrentIndex]
    options.splice(firstElementCurrentIndex, 1)
    
    let lastElementCurrentIndex = findOptionIndexWithValue(options, '+')
    let lastElement = options[lastElementCurrentIndex]
    options.splice(lastElementCurrentIndex, 1)

    let comparator = (option_a, option_b) => {
      if (option_a.value < option_b.value)
         return -1;
      if (option_a.value > option_b.value)
         return 1;
      return 0;
    }
    removeAllChildNodes(select)
    let orderedOptions = [firstElement, ...options.sort(comparator), lastElement]
    orderedOptions.forEach(node => select.appendChild(node))    
    select.options[0].selected = 'selected'
  }

  useTemplate(template, mapping, target, position) {
    let regex = new RegExp(Object.keys(mapping).join('|'), 'g')
    let mapMatch = match => mapping[match]
    let content = template.innerHTML.replace(regex, mapMatch)
    target.insertAdjacentHTML(position, content)
  }

  detectNewIngredientAndRedirect(event) {
    if (event.target.value === '+') {      
      let form = event.target.form
      let form_elements_array = Array.from(form.elements)
      let not_course_elements = form_elements_array.filter(element => !element.id.startsWith('course_'))
      let disabledElement = element => element.disabled = true
      not_course_elements.map(element => disabledElement(element))
      let submitter = document.createElement('button');
      submitter.type = 'submit'
      submitter.formAction = '/ingredients/new'
      submitter.formMethod = 'get'
      form.appendChild(submitter)
      form.requestSubmit(submitter)
    }
  }
}
