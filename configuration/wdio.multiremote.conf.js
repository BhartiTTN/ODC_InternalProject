/**
 * Created by adamShanahan on 5/29/18.
 */
const addCustomWebDriverCommands = require('./customWebdriverCommands/addCustomWebDriverCommands');
const args = require('yargs').argv;
const wdioConf = require('./wdio.conf.js').config;
const featuresFiles = args.features || '**/*.feature';

const capabilities = {
  browserA: {
    desiredCapabilities: {
      browserName: 'chrome',
      unexpectedAlertBehaviour: 'accept',
      startMaximized : true,
      chromeOptions: {
        args: [ 'window-size=1920,1080']
      }
    }
  },
  browserB: {
    desiredCapabilities: {
      browserName: 'chrome',
      unexpectedAlertBehaviour: 'accept',
      startMaximized : true,
      chromeOptions: {
        args: [ 'window-size=1920,1080']
      }
    }
  }
};


// Only run files under features/multiremoteFeatures
function setSpecs() {
  wdioConf.specs = [
    `./src/multiremote/multiremoteFeatures/**/${featuresFiles}`
  ];
}

function addMultiremoteSteps() {
  wdioConf.cucumberOpts.require.push('./src/multiremote/multiremoteSteps/when.js');
  wdioConf.cucumberOpts.require.push('./src/multiremote/multiremoteSteps/then.js');
  wdioConf.cucumberOpts.require.push('./src/multiremote/multiremoteSteps/given.js');
}


// Removing browser.windowHandleFullscreen() command. This causes errors with multi remote
function replaceBeforeHook() {
  wdioConf.before = () => {
    const chai = require('chai');
    chai.use(require('chai-date-proximity'));
    chai.use(require('chai-sorted'));

    global.expect = chai.expect;
    global.assert = chai.assert;
    global.should = chai.should();

    addCustomWebDriverCommands();
    browser.options = browserA.options;
  };
}

// Removing element highlighting from before hook. This causes issues with multi remote
function removeBeforeCommandHook() {
  wdioConf.beforeCommand = function beforeCommand(commandName, args) {
  };
}

// visual regression service causes issues with multi remote
function removeVisualRegressionService() {
  wdioConf.services = wdioConf.services.filter((service) => service !== 'visual-regression');
}

function updateConfig() {
  wdioConf.capabilities = capabilities;
  setSpecs();
  addMultiremoteSteps();
  replaceBeforeHook();
  removeBeforeCommandHook();
  removeVisualRegressionService();
}

updateConfig();
exports.config = wdioConf;
