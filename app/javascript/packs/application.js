import "controllers";

window.initMap = function (...args) {
  const event = document.createEvent("Events");
  event.initEvent("google-maps-callback", true, true);
  event.args = args;
  window.dispatchEvent(event);
};

require("trix");
require("@rails/actiontext");
