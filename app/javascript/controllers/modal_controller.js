import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["big", "normal"]

  connect() {
    console.log("hello from navbar_controller!")
    console.log(this.bigTarget)
    console.log(this.normalTarget)
  }

  display(event) {
    this.bigTarget.classList.remove('d-none')
    console.log('display')
  }

  close(event) {
    this.bigTarget.classList.add('d-none')
  }
}
