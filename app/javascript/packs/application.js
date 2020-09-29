// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import * as Vibrant from "node-vibrant";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();

  document.querySelectorAll("#camera").forEach((input) => {
    input.addEventListener("change", (event) => {
      console.log("here");
      const path = URL.createObjectURL(event.target.files[0]);
      Vibrant.from(path)
        .getPalette()
        .then((palette) => {
          const swatches = Object.values(palette);
          const hexCodes = swatches.map((swatch) => swatch.getHex());
          console.log(hexCodes);

          hexCodes.forEach((color) => {
            const colorInput = `<label class="color-card btn" style="background-color: ${color}" for="item_color_yellow">
              ${color}
            </label>
            <input type="radio" name="item[color]" id="item_color_black" value="${color}">`;
            const element = document.querySelector(".color-picker .cards");
            element.insertAdjacentHTML("beforeend", colorInput);
          });
          document.querySelectorAll(".color-card").forEach((card) => {
            card.addEventListener("click", (event) => {
              event.currentTarget.classList.toggle("selected");
              event.currentTarget.parentElement.parentElement.classList.toggle(
                "color-selected"
              );
              const buttons = document.querySelectorAll(".button-rectangle");
              console.log(buttons);
              buttons.forEach((button) => {
                console.log(button);
                button.classList.toggle("hidden");
              });
            });
          });
        });

      console.log(event);
      document
        .querySelector(".color-picker-wrapper")
        .classList.toggle("hidden");
    });
  });
});
