import {findElementInTable} from '../LookupTables/elementLookupTable';

module.exports = {
  dragSourceToDestination,
  dragByOffset
};

/**
 * Drag a source element to a given destination element
 * @param  {String}   source      The selector for the source element
 * @param  {String}   destination The selector for the destination element
 * @param  {Function} done        Function to execute when finished
 */
function dragSourceToDestination(source, destination, done) {
  const sourceSelector = findElementInTable(source);
  const destinationSelector = findElementInTable(destination);

  browser.waitForVisible(sourceSelector);
  browser.dragAndDrop(sourceSelector, destinationSelector);

  done();
}

/**
 *
 * @param source The selector for the source element
 * @param xOffset x offset to move the element by
 * @param yOffset y offset to move the element by
 * @param done Function to execute when finished
 */
// Clicks on the center of an element, and then drags it by a offset relative to the center of the element
function dragByOffset(source, xOffset, yOffset, done) {
  const sourceSelector = findElementInTable(source);

  // moveToObject offsets are relative to the top left corner of the element. This makes the offsets relative to the center of the object
  const elementDimensions = browser.getElementSize(sourceSelector);
  xOffset = parseInt(xOffset, 10) + elementDimensions.width /2;
  yOffset = parseInt(yOffset, 10) +  elementDimensions.height /2;

  browser.waitForVisible(sourceSelector);
  browser.moveToObject(sourceSelector).buttonDown().moveToObject(sourceSelector,xOffset,yOffset).buttonUp();

  browser.pause(500); // TODO: Temporary solution. QA-204

  done();
}
