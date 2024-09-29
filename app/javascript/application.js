import "@hotwired/turbo-rails"
import { Turbo } from "@hotwired/turbo-rails";

import "controllers"
// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require rails-ujs
//= require jquery
//= require materialize
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $(".dropdown-trigger").dropdown();
});