// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import { Turbo } from "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../stylesheets/application";
import "@fortawesome/fontawesome-free/css/all"
import "controllers"

require("bootstrap")

Rails.start()
ActiveStorage.start()
window.Turbo = Turbo

document.addEventListener("turbolinks:load", function() {
    $(function() {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})