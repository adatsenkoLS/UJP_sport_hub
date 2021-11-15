// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

global.bootstrap = require('bootstrap');

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "../javascript/channels"

import "../javascript/teams" 
import "../javascript/delete" 

import "easy-autocomplete/dist/jquery.easy-autocomplete"
import 'easy-autocomplete/dist/easy-autocomplete.themes'

Rails.start()
Turbolinks.start()
ActiveStorage.start()
