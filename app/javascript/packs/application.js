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
import * as NameThatColor from "ntc";
import "swiped-events"
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// const nextButton = document.getElementsByCLass("page next");
// nextButton.value = ">";
// const prevButton = document.getElementsByCLass("page prev");
// nextButton.value = "<";

document.addEventListener('swiped-left', function(e) {
  console.log(e.target); // element that was swiped
  console.log(e.detail); // event data { dir: 'left', xStart: 196, xEnd: 230, yStart: 196, yEnd: 4 }
  const next = document.querySelector(".shadow");
  console.log(next)
  next.click();
});

document.addEventListener('swiped-right', function(e) {
  console.log(e.target); // element that was swiped
  console.log(e.detail); // event data { dir: 'right', xStart: 196, xEnd: 230, yStart: 196, yEnd: 4 }
  const prev = document.querySelector(".front");
  console.log(prev)
  prev.click();

});


document.addEventListener("turbolinks:load", () => {
  // Call your functions here, e.g:
  // initSelect2();

  const collapseButton = document.querySelectorAll(".collapse-button")
  collapseButton.forEach((button) => {
    let arrow = button.querySelector(".rotate-icon")
    button.addEventListener("click", (event) => {
      console.log(button)
      arrow.classList.toggle("arrow-up")
    })
  })



   setTimeout(() => {
    const alert = document.querySelector(".alert")
    if (alert) {
      alert.parentElement.removeChild(alert)
    }
  },4000)


  const containerCarousel = document.querySelector(".container-adaptive")
  if (containerCarousel) {
    const color = document.getElementById("previous_color").getAttribute("data-url")
    const front = document.querySelector(".front")
    const shadow = document.querySelector(".shadow")
    setTimeout(() => {
      containerCarousel.style.background = color;
      console.log(color);
    }, 100 )
    console.log()
  }

  // This code will check if the current page is the items/new page, if it is not
  // the hidden class will be removed from the camera div and added to the content div
  // (see application.html.erb), then the image submission will be clicked in the formerly hidden
  // div. The form is now located inside shared/_item_form.html.erb -Eirik
  if (window.location.href != "http://localhost:3000/items/new" && window.location.href != "https://www.infitter.net/items/new") {
    const camera = document.getElementById("camera-home")
    if (camera) {
      camera.addEventListener("click", (event) => {
        event.preventDefault();
        const form = document.querySelector(".new-item-form");
        const content = document.querySelector(".page-content");
        form.classList.remove("hidden");
        const cameraInput = document.querySelector("#camera");
        cameraInput.click();
        content.classList.add("hidden")
        history.pushState(null, null, "items/new")
        console.log("home")
      })
    }
    const cameraLink = document.getElementById("camera-link")
    if (cameraLink) {
      cameraLink.addEventListener("click", (event) => {
        event.preventDefault();
        const form = document.querySelector(".new-item-form");
        const content = document.querySelector(".page-content");
        form.classList.remove("hidden");
        const cameraInput = document.querySelector("#camera");
        cameraInput.click();
        content.classList.add("hidden")
        history.pushState(null, null, "items/new")
        console.log("link")
      })
    }
  }

  const cameraFunc = (camera) => {

  }


  // history.pushState(null, null, "items/new")
  // window.location.href === /.*\/items\/new/

  //hiddden step1 and step2 on page when picking category
  document.querySelectorAll("#pick-category").forEach((button) =>{
    button.addEventListener("click", (event) => {
      console.log("click registered")
      document.querySelector(".step1").classList.add("hidden")
      document.querySelector(".step2").classList.remove("hidden")
      document.querySelectorAll(".clr-ellipse").forEach((circleBtn)=>{
        const color = document.querySelector("input[name='item[color]']:checked").value

        circleBtn.style.backgroundColor = color




      })
    })
  })

  // hiddden step1 and step2 on page when color is selected
  // document.querySelectorAll(".color-card.btn").forEach((button) =>{
  //   button.addEventListener("click", (event) => {
  //     document.querySelector(".step2").classList.add("hidden")
  //     document.querySelector(".step1").classList.remove("hidden")
  //     document.querySelector("h2").classList.add("hidden")
  //     document.querySelector("#camera").classList.add("hidden")
  //     console.log("color")

  //   })
  // })


  document.querySelectorAll("#camera").forEach((input) => {
    input.addEventListener("change", (event) => {
      document.querySelector("#camera").classList.add("hidden")
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
            const colorName = (NameThatColor.name(color))

            const colorInput = `<div class="color-flex"><label class="color-card btn" style="background-color: ${color}", for="item_color_${color}">
              <div class="text-picker">${colorName[1]}</div>
            </label></div>
            <input type="radio" name="item[color]" id="item_color_${color}" value="${color}">`;
            element.insertAdjacentHTML("beforeend", colorInput);
          });
          document.querySelectorAll(".color-card").forEach((card) => {
            card.addEventListener("click", (event) => {
              event.currentTarget.classList.toggle("selected");
              event.currentTarget.parentElement.parentElement.classList.add(
                "color-selected"
              );
              document.querySelector(".color-match").classList.add("hidden")
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

$(document).ready(function () {
  var timer = null;
  var self = $("confirmation-button");
  var clicked = false;
  $("confirmation-button").on("click", function () {
    if (clicked === false){
      self.removeClass("filled");
      self.addClass("circle");
      self.html("");
      clicked = true;
      $("svg.circle-icon").css("display", "block");
      $(".circle_2").attr("class", "circle_2 fill_circle");

      timer = setInterval(
        function tick() {
        self.removeClass("circle");
        self.addClass("filled");
        // self.html("b");
        $(".wrap .checkmark").css("display", "block");
        $("svg.circle-icon").css("display", "none");
        clearInterval(timer);
      }, 2500);
      }
  });
});



