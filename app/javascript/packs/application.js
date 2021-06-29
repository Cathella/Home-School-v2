//= require local-time

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import "controllers";
import LocalTime from "local-time";

Rails.start();
Turbolinks.start();
LocalTime.start();

window.initMap = function (...args) {
  const event = document.createEvent("Events");
  event.initEvent("google-maps-callback", true, true);
  event.args = args;
  window.dispatchEvent(event);
};

require("trix");
require("@rails/actiontext");
