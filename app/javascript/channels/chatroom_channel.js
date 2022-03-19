import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    alert(data.foo);
  }
});
