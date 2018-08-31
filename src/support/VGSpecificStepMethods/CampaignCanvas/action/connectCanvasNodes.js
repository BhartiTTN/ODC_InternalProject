/**
 * Created by adamShanahan on 2/1/18.
 */
import {getPortSelector} from '../../../LookupTables/selectorHelperFunctions/canvasSelectorHelperFunctions/getCanvasElement';

module.exports = {
  createEdgeAndConnectToTargetNode
};


/**
 * Creates an edge at the source node, and connects it to the target node on the campaign canvas
 * @param sourcePortType port type of first Node (top, bottom, left, right)
 * @param sourceNodeType Type of the node edge originates from (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param sourceNodeName Combined with sourceNodeType to uniquely identifies sourceNode (1 in Line Item 1, Name of a Creative, etc)
 * @param targetPortType Port type of second Node (top, bottom, left, right)
 * @param targetNodeType Type of the node edge connects to (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param targetNodeName Combined with targetNodeType to uniquely identifies targetNode (1 in Line Item 1, Name of a Creative, etc)
 * @param done
 */
function createEdgeAndConnectToTargetNode(sourcePortType, sourceNodeType, sourceNodeName, targetPortType, targetNodeType, targetNodeName, done) {
  const firstPortSelector = getPortSelector(sourcePortType, sourceNodeType, `${sourceNodeType}${sourceNodeName}`);
  const secondPortSelector = getPortSelector(targetPortType, targetNodeType, `${targetNodeType}${targetNodeName}`);

  browser.dragAndDrop(firstPortSelector,secondPortSelector);

  done();
}

