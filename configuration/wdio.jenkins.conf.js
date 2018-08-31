const _ = require('lodash');
const wdioConf = require('./wdio.conf.js').config;

const overrides = {
  maxInstances: 1, // TODO: Increase this once QA-178 is resolved.
  capabilities: [
    {
      maxInstances: 1, // TODO: Increase this once QA-178 is resolved.
      browserName : 'chrome',
      unexpectedAlertBehaviour: 'accept',
      chromeOptions: {
        args: ['--headless', '--window-size=1280,800']
      }
    }
  ]
};

exports.config = _.defaultsDeep(overrides, wdioConf);
