import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="formstyling"



export default class extends Controller {
    static targets = ["timepicker", "togglableElement", "datepicker"];

    updateDate() {
      const selectedDate = this.element.querySelector("#dates").value;
      const togglableElement = this.togglableElementTarget;
      togglableElement.classList.remove("d-none");
      this.datepickerTarget.value = selectedDate;
    }

    fire(event) {
      const selectedHour = event.target.innerText;
      this.timepickerTarget.value = selectedHour;
    }
}
