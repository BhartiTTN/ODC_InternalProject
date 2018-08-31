/**
 * Created by adamShanahan on 3/2/18.
 */
import {getEdgeSelector} from '../../../LookupTables/selectorHelperFunctions/canvasSelectorHelperFunctions/getCanvasElement';

/**
 * Deletes the edge between a given Source and target node on the campaign canvas
 * @param sourceNodeType Type of the node edge originates from (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param sourceNodeName Combined with sourceNodeType to uniquely identifies sourceNode (1 in Line Item 1, Name of a Creative, etc
 * @param targetNodeType Type of the node edge connects to (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param targetNodeName Combined with targetNodeType to uniquely identifies targetNode (1 in Line Item 1, Name of a Creative, etc)
 * @param done
 */
module.exports = (sourceNodeType, sourceNodeName, targetNodeType, targetNodeName, done) => {
  const edgeSelector = getEdgeSelector(sourceNodeType, `${sourceNodeType}${sourceNodeName}`, targetNodeType, `${targetNodeType}${targetNodeName}`);
  const edgeDeleteSelector = `${edgeSelector} .tool-remove`;
  browser.waitForVisible(edgeSelector);
  browser.click(edgeDeleteSelector);

  done();
};
