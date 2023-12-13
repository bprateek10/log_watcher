import consumer from "channels/consumer"

consumer.subscriptions.create("LogChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#logs")[0].innerHTML += data.data
    if(data.data != '\n')
      $("#logs")[0].innerHTML += "</br>" 
  }
})
