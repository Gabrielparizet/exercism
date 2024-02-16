// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  switch (name) {
    case "Pure Strawberry Joy":
      return 0.5;
    case "Energizer":
    case "Green Garden":
      return 1.5;
    case "Tropical Island":
      return 3;
    case "All or Nothing":
      return 5;
    default:
      return 2.5;
  }
  throw new Error("Please implement the timeToMixJuice function");
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  let wedges = 0;
  let limesNumber = 0;
  while (wedges < wedgesNeeded && limesNumber < limes.length) {
    // Ensure we don't exceed the array bounds
    switch (limes[limesNumber]) {
      case "small":
        wedges += 6;
        break;
      case "medium":
        wedges += 8;
        break;
      case "large":
        wedges += 10;
        break; // This break was missing
      default:
      // Normally, you might handle an unexpected case or do nothing
    }
    limesNumber++; // Increment limesNumber after each case
  }
  return limesNumber;

  throw new Error("Please implement the limesToCut function");
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  throw new Error("Please implement the remainingOrders function");
}
