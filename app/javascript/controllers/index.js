// Load all the controllers within this directory and all subdirectories.
// Controller files must be named *_controller.js.

import { preventOverflow } from "@popperjs/core"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /_controller\.js$/)
application.load(definitionsFromContext(context))

// const next = document.getElementById('next');
// const form_category = document.querySelectorAll(".form-category")
const introCard = document.querySelector(".website-presentation")

// next.addEventListener("click", (event) => {
//   // je prévent le default du click du next step
//   event.preventDefault();

//   // je selection la partie du questionnaire que l'on veut active
//   const active_form = document.querySelector(".form-category")

//   // je lui retire pour le rendre d-none
//   active_form.classList.remove("active")

//   // j'ajoute le .active a son sibling pour retirer le d-none
//   const next_category = active_form.nextElementSibling;
//   next_category.classList.add("active")

//   // on fait disparaitre la carde de présentation
//   intro_card.classList.add("d-none")
// })

const findDistrictButton = document.getElementById("find_district");
const nextButton = document.getElementById("next");
const previousButton =document.getElementById("previous");

findDistrictButton.addEventListener("click", (event) => {
  event.preventDefault();
  // je fais disparaitre le boutton "trouve ton quartier" et la card
  findDistrictButton.classList.add("disable");
  introCard.classList.add("disable");

  const activeForm = document.querySelector(".form-category");
  activeForm.classList.remove("active");

  activeForm.classList.add("active");
  nextButton.classList.add("active");
})

const activeForm = document.querySelector(".form-category")

nextButton.addEventListener("click", (event) => {
  event.preventDefault;

  activeForm.classList.remove("active");
  const nextCategory = activeForm.nextElementSibling;
  nextCategory.classList.add("active");
  console.log(nextCategory)
  previousButton.classList.add("active");
})
