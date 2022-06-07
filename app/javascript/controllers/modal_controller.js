import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
static targets = ["test", "normal"]

  connect() {
    console.log("hello from navbar_controller!")
    console.log(this.testTarget)
    console.log(this.normalTarget)
  }

  display(event) {
    this.testTarget.classList.remove('d-none')
    console.log('display')
  }

  close(event) {
    this.testTarget.classList.add('d-none')
  }
}
