import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "source", "copied" ]

  copy(){
    this.sourceTarget.select()
    document.execCommand("copy")
    this.copiedTarget.textContent = 'Copied!'
  }

  open(){
    let content = this.sourceTarget.value
    window.open(content, '_blank');
  }
}
