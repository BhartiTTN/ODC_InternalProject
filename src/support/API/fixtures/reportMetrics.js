/**
 * Created by adamShanahan on 5/15/18.
 */

/**
 * Translates arguments from Gherkin mapping to the relevant metric field for the Reports Service API
 * Translates metrics from this mapping: 'I have a report named "([^"]+)" with dimensions "([^"]*)?" and metrics "([^"]*)?"$'
 */
module.exports = {
  'Completed Views' : 'COMPLETED_VIEWS',
  'Delivered Views' : 'DELIVERED_VIEWS',
  '25% Completion' : 'QUARTILE_VIEWS_25',
  '50% Completion' : 'QUARTILE_VIEWS_50',
  '75% Completion' : 'QUARTILE_VIEWS_75',
};
