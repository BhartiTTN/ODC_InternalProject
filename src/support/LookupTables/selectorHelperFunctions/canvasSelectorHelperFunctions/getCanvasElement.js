/**
 * Created by adamShanahan on 3/2/18.
 */

module.exports = {
  getEdgeSelector,
  getPortSelector,
  getNodeSelector
};


/**
 * Returns the selector for a port on a given node on the campaign canvas
 * @param {String} portType port type of Node (top, bottom, left, right)
 * @param {String} nodeType Type of Node port is on (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param {String} nodeName Name of a Creative or Line Item Node (Line Item 1, "Creative 2 DO-NOT DEL", "Targeting 1", "Tracking 1",etc)
 * @returns {String} Returns relevant selector
 */
function getPortSelector(portType, nodeType, nodeName) {
  const nodeSelector = getNodeSelector(nodeType, nodeName);
  return `${nodeSelector} [port-group="${portType}"]`;
}

/**
 * Returns the selector for a given node on the campaign canvas. Returns 'Node Not Found' if the requested Node does not exist
 * @param {String} nodeType Type of Node (Start Node|Creative|Line Item|Targeting|Tracking|Creative Group)
 * @param {String} nodeName Name of a Creative or Line Item Node (Line Item 1, "Creative 2 DO-NOT DEL", "Targeting 1", "Tracking 1",etc)
 * @returns {String} Returns relevant selector
 */
function getNodeSelector(nodeType, nodeName) {
  let childNodeSelector = formatNodeType(nodeType);
  const isStartNode = childNodeSelector.includes('START');

  childNodeSelector = (!isStartNode) ? `[data-pseudo-id='${childNodeSelector}-${nodeName}']` : `[data-pseudo-id='${childNodeSelector}']`;

  // Exits gracefully if the Node isn't there. This allows it to be used when called by the negative case in the isExisting step method.
  browser.waitForExistNoError(childNodeSelector, 4000);
  if (!browser.isExisting(childNodeSelector)) {
    return 'Node Not Found';
  }

  const parentNodeID = browser.getAttribute(childNodeSelector, 'data-primary-id');

  return `.joint-type-vg[model-id='${parentNodeID}']`;
}


/**
 * Returns the selector for an edge between a given start and end noderight)
 * @param {String} sourceNodeType Type of the node edge originates from (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param {String} sourceNodeName combined with sourceNodeType to uniquely identifies sourceNode (1 in Line Item 1, Name of a Creative, etc)de (top, bottom, left, right)
 * @param {String} targetNodeType Type of the node edge connects to (Start Node|Creative|Line Item|Targeting|Tracking)
 * @param {String} targetNodeName combined with targetNodeType to uniquely identifies targetNode (1 in Line Item 1, Name of a Creative, etc)
 * @returns {String} Returns relevant selector
 */
function getEdgeSelector(sourceNodeType, sourceNodeName, targetNodeType, targetNodeName) {
  sourceNodeType = formatNodeType(sourceNodeType);
  targetNodeType = formatNodeType(targetNodeType);
  const sourceNodeSelector = (!sourceNodeType.includes('START')) ? `[from-pseudo-id='${sourceNodeType}-${sourceNodeName}']` : `[from-pseudo-id='${sourceNodeType}']`;
  const targetNodeSelector = (!targetNodeType.includes('START')) ? `[to-pseudo-id='${targetNodeType}-${targetNodeName}']` : `[to-pseudo-id='${targetNodeType}']`;

  const edgeSelector = `${sourceNodeSelector}${targetNodeSelector}`;
  return edgeSelector;
}

function formatNodeType(nodeType) {
  nodeType = nodeType.toUpperCase();
  nodeType = nodeType.replace(/ /g, '');

  return nodeType;
}
