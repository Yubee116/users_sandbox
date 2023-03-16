import { Controller } from "@hotwired/stimulus"
// import debounce from "debounce";

export default class extends Controller {

  submit(_event) {
    this.element.requestSubmit();
  }
}