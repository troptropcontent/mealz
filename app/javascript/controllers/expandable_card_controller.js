import { Controller } from "@hotwired/stimulus"
import { useClickOutside } from 'stimulus-use'

// Connects to data-controller="expandable-card"
export default class extends Controller {
  static targets = [ "expandable", "chevronUp", "chevronDown" ]
  connect() {
    useClickOutside(this)
  }

  get siblings() {
    const isSibling = ({identifier, element}) => identifier == this.identifier && element != this.element
    return this.application.controllers.filter(controller => isSibling(controller))
  }

  toggleExpandable() {
    const isCollapsed = this.expandableTarget.classList.contains('hidden')
    
    if (isCollapsed) {
      this.closeOtherCollapsables()
      this.expand()
    } else {
      this.collapse()
    }

  }

  closeOtherCollapsables(){
    this.siblings.forEach(sibling => sibling.collapse())
  }

  collapse(){
    this.expandableTarget.classList.add('hidden')
    this.chevronUpTarget.classList.add('hidden')
    this.chevronDownTarget.classList.remove('hidden')
  }

  expand(){
    this.expandableTarget.classList.remove('hidden')
    this.chevronDownTarget.classList.add('hidden')
    this.chevronUpTarget.classList.remove('hidden')
  }

  clickOutside() {
    this.collapse()
  }
}
