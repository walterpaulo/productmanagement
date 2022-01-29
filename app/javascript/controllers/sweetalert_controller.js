import Swal from 'sweetalert2'
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static values = { title: String }

  connect() {
    this.redirect = false;
  }
  showAlert(event){
    if (this.redirect) return;

    event.stopImmediatePropagation();
    event.preventDefault();
    Swal.fire({
      title: this.titleValue,
      showDenyButton: true,
      showConfirmButton: false,
      showCancelButton: true,
      denyButtonText: 'Yes',
      cancelButtonText: `No`,
    }).then((result) => {
      if (result.isDenied) {
        this.redirect = true
        this.element.click();
      }
    })
  }
}