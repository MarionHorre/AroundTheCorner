import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "card", 'form' ]



  selectedDistrict(event) {
    this.formTarget.innerHTML=  `<input name='house[disctrictId]' value=${event.currentTarget.dataset.id}>`
  }
}
