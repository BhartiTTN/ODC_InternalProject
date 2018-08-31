import {getVariable} from '../LookupTables/storedVariables';

/**
 * Open the given perf druid url
 * @param  {String}   fact Fact argument to pass to Druid. Examples: RTBBid, RTBWin, PlayerEvent, etc
 * @param  {String}   filterByNewestCampaign passes the newest campaignId as a filter if this is set
 * @param  {Function} done Function to execute when finished
 */

module.exports = (fact, filterByNewestCampaign,done) => {
  const url = getPerfUrl(fact, filterByNewestCampaign);

  browser.url(url);

  browser.pause(3000); // Gives browser time to load new page.

  done();
};

function getPerfUrl(fact, filterByNewestCampaign) {
  const fromdatestr = getFromDateString();

  let url = `https://qa2.viralgains.com/vg/staff/druid?fact=${fact}&detailed=false${fromdatestr}`;

  if (filterByNewestCampaign) {
    url += `&filter=campaignID%3D${getVariable('Current Campaign ID')}`;
  }

  return url;
}

function getFromDateString() {
  const nowDate = new Date();
  const date =  `${nowDate.getFullYear()}-${nowDate.getMonth()+1}-${nowDate.getDate()}`;
  return `&fromTime=${ date  }T00%3A00%3A00.000Z`;
}
