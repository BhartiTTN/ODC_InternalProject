const path = require('path');
const VisualRegressionCompare = require('wdio-visual-regression-service/compare');
const args = require('yargs').argv;
const addCustomWebDriverCommands = require('./customWebdriverCommands/addCustomWebDriverCommands');
const allureReporter = require('wdio-allure-vg-reporter');
const setDefaultAuthToken = require('../src/support/API/services/auth/setAuthenticationToken');
const {cleanupAPIData} = require('../src/support/API/APICleanup/APICleanup');
const setEnvironmentVariables = require('./environment/setEnvironmentVariables');
const setLocalStorage = require('./setLocalStorage');

const featuresFiles = args.features || '**/*.feature';
const whichProfile = args.profile || 'iphone5S';
const portNumber = args.port || 4444; // 4723 is appium port. 4444 is default port, used for running non appium tests.
const browserName = args.browser || 'chrome';
const demoPause = args.demoPause || false;
const stepMethodTimeout = args.stepMethodTimeout || 9999999;
const {environment} = args;

let screenshotTestName;


function getFullScreenshotName(basePath) {
  return function (context) {
    const {type} = context;
    const browserVersion = parseInt(context.browser.version, 10);
    const browserName = context.browser.name;
    const viewPort = context.meta.viewport;
    const dimensions = `${viewPort.width}x${viewPort.height}`;
    return path.join(basePath, `${screenshotTestName}_${type}_${browserName}_v${browserVersion}_${dimensions}.png`);
  };
}

exports.setScreenshotTestName = (name) => {
  screenshotTestName = name;
};

let unnamedScenarioCounter = 0; // Used to give unnamed Scenarios a unique indicator

exports.config = {
  //
  // ==================
  // Specify Test Files
  // ==================
  // Define which test specs should run. The pattern is relative to the
  // directory from which `wdio` was called. Notice that, if you are calling
  // `wdio` from an NPM script (see https://docs.npmjs.com/cli/run-script)
  // then the current working directory is where your package.json resides, so
  // `wdio` will be called from there.
  //

  specs: [
    `./src/features/**/${  featuresFiles}`
  ],
  // Patterns to exclude.
  // exclude: [
  // 'path/to/excluded/files'
  // ],
  //
  // ============
  // Capabilities
  // ============
  // Define your capabilities here. WebdriverIO can run multiple capabilities
  // at the same time. Depending on the number of capabilities, WebdriverIO
  // launches several test sessions. Within your capabilities you can
  // overwrite the spec and exclude options in order to group specific specs
  // to a specific capability.
  //
  // First, you can define how many instances should be started at the same
  // time. Let's say you have 3 different capabilities (Chrome, Firefox, and
  // Safari) and you have set maxInstances to 1; wdio will spawn 3 processes.
  // Therefore, if you have 10 spec files and you set maxInstances to 10, all
  // spec files will get tested at the same time and 30 processes will get
  // spawned. The property handles how many capabilities from the same test
  // should run tests.
  //
  maxInstances: 1,
  port: portNumber,
  //
  // If you have trouble getting all important capabilities together, check
  // out the Sauce Labs platform configurator - a great tool to configure your
  // capabilities: https://docs.saucelabs.com/reference/platforms-configurator
  //
  capabilities: [
    // maxInstances can get overwritten per capability. So if you have an
    // in-house Selenium grid with only 5 firefox instance available you can
    // make sure that not more than 5 instance gets started at a time.
    {
      maxInstances: 1,
      browserName,
      unexpectedAlertBehaviour: 'accept',
    }],
  // ===================
  // Test Configurations
  // ===================
  // Define all options that are relevant for the WebdriverIO instance here
  //
  // By default WebdriverIO commands are executed in a synchronous way using
  // the wdio-sync package. If you still want to run your tests in an async
  // way e.g. using promises you can set the sync option to false.
  sync: true,
  //
  // Level of logging verbosity: silent | verbose | command | data | result |
  // error
  logLevel: 'error',

  deprecationWarnings: false,
  //
  // Enables colors for log output.
  coloredLogs: true,
  //
  // Saves a screenshot to a given path if a command fails.
  screenshotPath: './errorShots/',
  //
  // Set a base URL in order to shorten url command calls. If your url parameter starts
  // with "/", then the base url gets prepended.
  baseUrl: 'https://odc-ui.int.kube.viralgains.com',
  //
  // Default timeout for all waitFor* commands.
  waitforTimeout: 15000,
  //
  // Default timeout in milliseconds for request
  // if Selenium Grid doesn't send response
  connectionRetryTimeout: 90000,
  //
  // Default request retries count
  connectionRetryCount: 3,
  //
  // Initialize the browser instance with a WebdriverIO plugin. The object
  // should have the plugin name as key and the desired plugin options as
  // properties. Make sure you have the plugin installed before running any
  // tests. The following plugins are currently available:
  // WebdriverRTC: https://github.com/webdriverio/webdriverrtc
  // Browserevent: https://github.com/webdriverio/browserevent
  plugins: {
    'wdio-screenshot': {}
    //     webdriverrtc: {},
    //     browserevent: {}
  },
  //
  // Test runner services
  // Services take over a specific job you don't want to take care of. They
  // enhance your test setup with almost no effort. Unlike plugins, they don't
  // add new commands. Instead, they hook themselves up into the test process.
  services: ['selenium-standalone', 'visual-regression'],

  seleniumInstallArgs: {
    version: '3.4.0',
    drivers: {
      chrome: {
        version: '2.40'
      },
      firefox: {version: '0.19.0'}
    }
  },
  seleniumArgs: {
    version: '3.4.0',
    drivers: {
      chrome: {version: '2.40'},
      firefox: {version: '0.19.0'}
    }
  },

  visualRegression: {
    compare: new VisualRegressionCompare.LocalCompare({
      referenceName: getFullScreenshotName(path.join(process.cwd(), 'screenshots/reference')),
      screenshotName: getFullScreenshotName(path.join(process.cwd(), 'screenshots/screen')),
      diffName: getFullScreenshotName(path.join(process.cwd(), 'screenshots/diff')),
      misMatchTolerance: 0.01,
    })
  },


  //
  // Framework you want to run your specs with.
  // The following are supported: Mocha, Jasmine, and Cucumber
  // see also: http://webdriver.io/guide/testrunner/frameworks.html
  //
  // Make sure you have the wdio adapter package for the specific framework
  // installed before running any tests.
  framework: 'cucumber',
  //
  // Test reporter for stdout.
  // The only one supported by default is 'dot'
  // see also: http://webdriver.io/guide/testrunner/reporters.html
  reporters: ['junit', 'allure-vg'],

  reporterOptions: {
    junit: {
      outputDir: './reports/junit',
    },
    'allure-vg': {
      outputDir: './reports/allure-results'
    }
  },

  demopause: demoPause,

  elementsThatCauseLoadingOrModalErrors: {
    'Account Management': ['Current Tab Loading Message'],
    'Sort By Account Name': ['Current Tab Loading Message'],
    'Account Tab': ['Current Tab Loading Message'],
    'Back': ['Current Tab Loading Message'],
    'Campaign Management': ['Current Tab Loading Message', 'Delete Confirmation Popup'],
    'Creative Tab': ['Current Tab Loading Message'],
    'Disable Button': ['Current Tab Loading Message'],
    'Enable Button': ['Current Tab Loading Message'],
    'Email Column Sort Icon': ['Current Tab Loading Message'],
    'Grid Campaign Name': ['Current Tab Loading Message'],
    'Groups Tab': ['Current Tab Loading Message'],
    'Users Tab': ['Current Tab Loading Message'],
    '# of Groups Column': ['Current Tab Loading Message'],
    'Close': ['Account Management and Campaign Popup'],
    'Invite': ['Account Management and Campaign Popup','Current Tab Loading Message' ],
    'LineItem Tab': ['Current Tab Loading Message'],
    'Create Button': ['Account Management and Campaign Popup', 'Current Tab Loading Message'],
    'Delete Button in Delete Confirmation Pop-Up': ['Current Tab Loading Message', 'Delete Confirmation Popup'],
    'delivery button': ['delivery loading message'],
    'Save': ['Account Management and Campaign Popup', 'Current Tab Loading Message'],
    'Submit': ['Account Management and Campaign Popup', 'Current Tab Loading Message'],
    'Next': ['Current Tab Loading Message'],
    'Campaign Name Link': ['Loading Messages'],
    'Cancel': ['Popup Window'],
    'Delivery_Save Button': ['Popup Window'],
    'Report Management': ['Loading Messages'],
    'Report Dashboard Button': ['Loading Messages'],
    'Sort By Report Name': ['Loading Messages'],
    'Create Creative Group Icon':['CampaignGroup loading message'],
  },
  //
  // If you are using Cucumber you need to specify the location of your step
  // definitions.
  cucumberOpts: {
    require: [
      './src/steps/apiSteps/given.js',
      './src/steps/apiSteps/when.js',
      './src/steps/emailSteps/given.js',
      './src/steps/emailSteps/when.js',
      './src/steps/emailSteps/then.js',
      './src/steps/otherSteps/given.js',
      './src/steps/otherSteps/then.js',
      './src/steps/otherSteps/when.js',
      './test/steps/testWhen.js'
    ], // <string[]> (file/dir) require files before executing features
    backtrace: false, // <boolean> show full backtrace for errors
    compiler: [
      'js:babel-register',
    ], // <string[]> ("extension:module") require files with the given
    // EXTENSION after requiring MODULE (repeatable)
    dryRun: false, // <boolean> invoke formatters without executing steps
    failFast: false, // <boolean> abort the run on first failure
    snippets: true, // <boolean> hide step definition snippets for pending
    // steps
    source: true, // <boolean> hide source uris
    profile: [], // <string[]> (name) specify the profile to use
    strict: true, // <boolean> fail if there are any undefined or pending
    // steps
    tags: require('../src/tagProcessor')(process.argv),
    // <string[]> (expression) only execute the features or scenarios with
    // tags matching the expression
    timeout: stepMethodTimeout,     // <number> timeout for step definitions
    ignoreUndefinedDefinitions: false, // <boolean> Enable this config to
    // treat undefined definitions as
    // warnings.
  },
  //
  // =====
  // Hooks
  // =====
  // WebdriverIO provides several hooks you can use to interfere with the test
  // process in order to enhance it and to build services around it. You can
  // either apply a single function or an array of methods to it. If one of
  // them returns with a promise, WebdriverIO will wait until that promise got
  // resolved to continue.
  //
  // Gets executed once before all workers get launched.
  // onPrepare: function onPrepare(config, capabilities) {
  // },
  //
  // Gets executed before test execution begins. At this point you can access
  // all global variables, such as `browser`. It is the perfect place to
  // define custom commands.
  before: function before() {
    /**
     * Setup the Chai assertion framework
     */
    const chai = require('chai');
    chai.use(require('chai-date-proximity'));
    chai.use(require('chai-sorted'));

    global.expect = chai.expect;
    global.assert = chai.assert;
    global.should = chai.should();

    addCustomWebDriverCommands();
    browser.windowHandleFullscreen();
  },
  //
  // Hook that gets executed before the suite starts
  // beforeSuite: function beforeSuite(suite) {
  // },
  //
  // Hook that gets executed _before_ a hook within the suite starts (e.g.
  // runs before calling beforeEach in Mocha)
  // beforeHook: function beforeHook() {
  // },
  //
  // Hook that gets executed _after_ a hook within the suite starts (e.g. runs
  // after calling afterEach in Mocha)
  // afterHook: function afterHook() {
  // },
  //
  // Function to be executed before a test (in Mocha/Jasmine) or a step (in
  // Cucumber) starts.
  // This hook doesn't work: https://github.com/webdriverio/webdriverio/issues/1894#issuecomment-282499321
  // beforeTest: function beforeTest(test) {
  // },
  //
  // Runs before a WebdriverIO command gets executed.

  beforeCommand: function beforeCommand(commandName, args) {
    const highlightElementWhiteList = ['click', 'element', 'elements'];

    if (highlightElementWhiteList.includes(commandName) && args.length > 0) {
      const element = $(args[0]).value;
      try {
        browser.highlightElement(element);
      } catch(e) {
        // No need to throw an error if the element can't be highlighted
      }
    }
  },
  //
  // Runs after a WebdriverIO command gets executed
  // afterCommand: function afterCommand(commandName, args, result, error) {
  // },
  //
  // Function to be executed after a test (in Mocha/Jasmine) or a step (in
  // Cucumber) starts.
  // This hook doesn't work: https://github.com/webdriverio/webdriverio/issues/1894#issuecomment-282499321
  // afterTest: function afterTest(test) {
  // },
  //
  // Hook that gets executed after the suite has ended
  // afterSuite: function afterSuite(suite) {
  // },
  //
  // Gets executed after all tests are done. You still have access to all
  // global variables from the test.
  // after: function after(result, capabilities, specs) {
  // },
  //
  // Gets executed after all workers got shut down and the process is about to
  // exit. It is not possible to defer the end of the process using a promise.
  // onComplete: function onComplete(exitCode) {
  // }
  // Cucumber specific hooks
  beforeFeature(feature) {
    setEnvironmentVariables(environment);

    const token = browser.call(() => {
      return setDefaultAuthToken(undefined, undefined, undefined, () => {
      });
    });

    setLocalStorage('token', token); // Set local storage token for default account so we don't have to login through the UI
  },

  beforeScenario(scenario) {
    if (!scenario.getName()) {
      unnamedScenarioCounter++;
    }
  },
  beforeStep(step) {
    const scenario = step.getScenario();
    const featureName = scenario.getFeature().getName();
    const scenarioName = scenario.getName() || `Unnamed Scenario ${unnamedScenarioCounter}`;
    const tags = scenario.getTags();

    allureReporter.feature(featureName);
    allureReporter.story(scenarioName);

    if (tags.length > 0) {
      const description = tags.reduce((tagList, tag) => `${tagList} ${tag.getName()}`, 'Tags List:');
      allureReporter.addDescription(description);
    }

  },
  afterStep(stepResult) {
  },
  afterScenario(scenario) {
    return cleanupAPIData(); // Clean up all Users, Campaigns etc that were created through the API at the beginning of this scenario
  },

  afterFeature(feature) {
  }
};
