/// <reference path="./global.d.ts" />
// @ts-check

export function cookingStatus(remainingTime) {
  switch (remainingTime) {
    case 0:
      return "Lasagna is done.";
      break;
    case undefined:
      return "You forgot to set the timer.";
      break;
    default:
      return "Not done, please wait.";
  }
}

export function preparationTime(layers, timePerLayer) {
  switch (timePerLayer) {
    case undefined:
      return layers.length * 2;
      break;
    default:
      return layers.length * timePerLayer;
  }
}

export function quantities(layers) {
  let noodleCount = 0;
  let sauceCount = 0;
  for (let i = 0; i < layers.length; i++) {
    switch (layers[i]) {
      case "noodles":
        noodleCount += 50;
        break;
      case "sauce":
        sauceCount += 0.2;
        break;
    }
  }
  return { noodles: noodleCount, sauce: sauceCount };
}

export function addSecretIngredient(friendsList, myList) {
  let secretIngredient = friendsList.at(-1);
  myList.push(secretIngredient);
}

// const recipe = {
//     noodles: 200,
//     sauce: 0.5,
//     mozzarella: 1,
//     meat: 100,
//   };
export function scaleRecipe(recipe, portionsNumber) {
  let multiplyer = portionsNumber / 2;
  const scaledRecipe = {};
  for (let ingredient in recipe) {
    scaledRecipe[ingredient] = recipe[ingredient] * multiplyer;
  }
  return scaledRecipe;
}
