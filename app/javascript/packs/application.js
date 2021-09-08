// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import { start as ujsStart } from '@rails/ujs';
import { start as turubolinkStart} from 'turbolinks';
import { start as activeStorageStart} from '@rails/activestorage';
import "core-js/stable";
import "regenerator-runtime/runtime";
import channels from "channels";
import jQuery from "jquery";
import 'bootstrap';
import '../stylesheets/application';
import "@fortawesome/fontawesome-free/js/all";
import './custom';
import './cep/cep_manager'

import jQuery_nested_form from "jquery_nested_form";
import './datepicker/datepicker';
import '@coreui/coreui';
import '@coreui/chartjs';
import '@coreui/utils';

console.log("Start WebPacker ");


ujsStart();
turubolinkStart();
activeStorageStart();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
 const images = require.context('../images', true)
 const imagePath = (name) => images(name, true)
//import brflag from 'famfamfam-flags/dist/png/br.png'
//const domflag = document.createElement('img')
//domflag.setAttribute('src', brflag)
//document.querySelector('body').append(domflag)