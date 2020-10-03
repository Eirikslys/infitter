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
  document.querySelectorAll("#pick-category").forEach((button) =>{
    button.addEventListener("click", (event) => {
      document.querySelector(".step1").classList.add("hidden")
      document.querySelector(".step2").classList.remove("hidden")
    })
  })

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

          const element = document.querySelector(".color-picker .cards");
          element.innerHTML = "";

          hexCodes.forEach((color) => {

            const colorInput = `<label class="color-card btn" style="background-color: ${color}" for="item_color_yellow">
              ${color}
            </label>
            <input type="radio" name="item[color]" id="item_color_black" value="${color}">`;
            element.insertAdjacentHTML("beforeend", colorInput);
          });
          document.querySelectorAll(".color-card").forEach((card) => {
            card.addEventListener("click", (event) => {
              event.currentTarget.classList.toggle("selected");
              event.currentTarget.parentElement.parentElement.classList.add(
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
        .classList.remove("hidden");
    });
  });
});

// $(document).ready(function () {
//   var timer = null;
//   var self = $("button");
//   var clicked = false;
//   $("button").on("click", function () {
//     if (clicked === false){
//       self.removeClass("filled");
//       self.addClass("circle");
//       self.html("");
//       clicked = true;
//       $("svg.circle-icon").css("display", "block");
//       $(".circle_2").attr("class", "circle_2 fill_circle");

//       timer = setInterval(
//         function tick() {
//         self.removeClass("circle");
//         self.addClass("filled");
//         // self.html("b");
//         $(".wrap .checkmark").css("display", "block");
//         $("svg.circle-icon").css("display", "none");
//         clearInterval(timer);
//       }, 2500);
//       }
//   });
// });


