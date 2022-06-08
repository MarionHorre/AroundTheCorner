
import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// import Sortable from 'stimulus-sortable'
// const application = Application.start()
// application.register('sortable', Sortable)

export default class extends Controller {
static targets= ["list"]

  connect() {
    // Sortable.create(this.element, {
    //   ghostClass: "ghost",
    //   animation: 150,

    // })

    // console.log(this.listTarget)

    new Sortable(this.element, {
      group: 'shared', // set both lists to same group
      animation: 150,
      onEnd: this.makeMultiplicator
  });


  }

  makeMultiplicator() {
    const container = document.getElementById("priority-container")
    const hash = {}
    const elements = container.childNodes
    elements.forEach((element, index) => {
      console.log(element.dataset.type)
      hash[element.dataset.type] = index + 1
    })
    const input = document.getElementById("input_priority")
    input.value = JSON.stringify(hash)
  }
}
//
//       }
