import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  remove() {
    // When we call this function, it removes the DOM node where the controller is attached.
    this.element.remove()
  }
}
