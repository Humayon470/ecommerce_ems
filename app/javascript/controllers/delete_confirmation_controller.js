import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["delete"];

  connect() {
    console.log("Connected to delete confirmation controller");
  }

  show(event) {
    event.preventDefault();
    const { deleteUrl } = event.currentTarget.dataset;
    $('#del-btn').attr('href', deleteUrl)
    $('#del-modal').show();
    this.hide();
  }

  hide() {
    $('#close-btn').click(function(){
      $('#del-modal').hide(); 
    });
  }
}
