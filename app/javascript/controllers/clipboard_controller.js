import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["input"]
  
  copy() {
    const element = this.inputTarget.value
    navigator.clipboard.writeText(element)
  }

  open() {
    let content = this.inputTarget.value
    window.open(content, '_blank');
  }
  
}
