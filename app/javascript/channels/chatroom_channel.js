import consumer from "./consumer"
// ../packs/application.js ファイルで定義した関数 scroll_bottom()をimportする
import scroll_bottom from '../packs/application'


consumer.subscriptions.create("ChatroomChannel", {
  connected() {
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $('#message-container').append(data.mod_message);
    scroll_bottom();
  }
});
