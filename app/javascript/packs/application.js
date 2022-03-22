// window.jQuery = $;
// window.$ = $;
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");
require('bootstrap/dist/js/bootstrap.min.js');
require("jquery");
require("./semantic.js");

import 'bootstrap';
import "packs/semantic.css";
import "packs/application.css";


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery-ujs
//= require jquery.turbolinks
//= require bootstrap-sprockets
//= require semantic-ui
//= require popper
//= require activestorage
//= require_tree .

// 他のjsファイルでもこの関数を使えるようにexportする
export default function scroll_bottom(){
  if($('#messages').length > 0){
    // scrollTop(引数: 画面の縦方向にどれくらい進むかを指定)
    // -> $('#messages')の高さ分縦方向に進んだところ -> $('#messages')の一番下に移動する
      $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
};

function submit_message() {
  $('#message_body').on('keydown', function(e) {
    if(e.keyCode == 13) {
      $('button').click();
      e.target.value = "";
    }
  })
}

// turbolinks:load -> load jquery when at the time of page transition
$(document).on('turbolinks:load', function(){
    $('.ui.dropdown').dropdown();
    $('.message .close').on('click', function(){
      $(this).closest('.message').transition('fade');
    });
    submit_message();
    scroll_bottom();
  });
