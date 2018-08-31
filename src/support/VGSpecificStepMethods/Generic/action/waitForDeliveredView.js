/**
 * Created by adamShanahan on 4/25/18.
 */
import currentVastUrl from '../../../objects/currentVastUrl';
import cheerio from 'cheerio';
import moment from 'moment';

/**
 * Pauses long enough for a video in Google Vast Inspector to generate a Delivered View.
 * This is based off the Duration tag from the most recent RTB response.
 * It pauses for either the duration of the video, or 30 seconds. Whichever is smaller.
 * @param {Function} done Function to Execute when finished
 */
module.exports = (done) => {
  const newestVastXml = currentVastUrl.getInstance().getVastUrl();

  const adDuration = getAdDuration(newestVastXml);
  const maxWaitTime = 30000;
  const waitTime = Math.min(adDuration, maxWaitTime);

  browser.pause(waitTime);

  done();
};


function getAdDuration(xml) {
  const $ = cheerio.load(xml, {
    xmlMode: true
  });

  const durationSelector = 'VAST Ad InLine Creatives Creative Linear Duration';
  const durationString = $(durationSelector).text();

  return convertHMSToSeconds(durationString);
}

/**
 * Converts Strings of the form "HH:MM:SS" to seconds
 * @param durationString Time string of the form "HH:MM:SS"
 */
function convertHMSToSeconds(durationString) {
  return moment.duration(durationString).asMilliseconds();
}
