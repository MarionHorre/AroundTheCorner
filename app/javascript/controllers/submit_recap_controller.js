import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ['button']

  submit() {
    this.buttonTarget.click()
  }
}
