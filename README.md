cucumber-salad
--------------
Cucumber-salad is ViralGain's way of running WebdriverIO tests with Cucumber.

It is based off of this repository: https://github.com/webdriverio/cucumber-boilerplate

The confluence page with more information can be found here: https://viralgains.atlassian.net/wiki/spaces/EN/pages/186810429/Cucumber


## Installation
`npm install`

## Running the Example Feature File
Let's run a test file to make sure everything's set up correctly

`npm run example`


## Running additional cucumber-salad feature files
Cucumber-salad scripts are run from the terminal by calling npm start and passing arguments through yargs. 

`npm start —- -—argument1=x -—argument2=y -—argument3=z…..`

The first set of dashes are necessary to cancel out arguments passed to npm. 

### Arguments for running tests
* features
    * Regular expression that tells cucumber-salad which feature files to run under src/reports.
    * By default, cucumber-salad will run all feature files under src/reports
    * Examples
        * `npm start —- -—features=simple_video_test.feature`
            * Run this specific feature file
        * `npm start –- --features=**/ODC*.feature`
            * Run all feature file that start with ODC
* browser
    * Name of browser to run the test on
    * By default cucumber-salad will run chrome
    * Example: `npm start -— -—features=simple_video_test.feature -—browser=chrome`
* port
    * Which port to run the cucumber-salad tests through
    * Use 4723 to run tests through appium, port 4444 to run tests on your desktop browser.
    * default is 4444, or running on desktop
    * Example: `npm start —- -—features=simple_video_test.feature -—port=4444`
* profile
    * Set of arguments passed to appium. These arguments are located in the profiles dictionary
    * this is irrelevant if you are running a cucumber-test on a desktop browser.
    * Example: `npm start —- -—features=simple_video_test.feature -—profile=android80 -—port=4723`
* demoPause
    * 'true' or 'false' value.
    * Whether or not to pause when the 'I pause for Demo' mapping is called
    * Defaults to false.
* stepMethodTimeout
   * Number of milliseconds a step method will wait before timing out
   * sets cucumberOpts.timeout
   * Defaults to 40000, or 40 seconds
* environment
   * CURRENTLY DISABLED, always running on int
   * Sets which environment to run the scripts on
   * Options are 'int', 'local', 'staging'. Defaults to int
   
   
## Setup and Teardown of Feature Files
### Setting up the data you need for tests
Sometimes scenarios rely on data such as accounts, users, or campaigns existing ahead of time. This data should be created through
the API as it is much faster and less prone to failure. The Gherkin mappings for creating data through the API can be found under
src/steps/apiSteps.

Any data created this way will be automatically deleted at the end of each scenario, so there is no need to do it through the UI.

### Default Authentication Token
Cucumber-Salad automatically attaches an authentication token for QA@viralgains.com to the browser's local storage before each Feature.
This means there is no need to login through the UI before each Scenario if you are using this account. 

The token will detach if you login to a different account, or logout at any point during the feature file. If this happens you will
have to login through the UI at the start of the next scenario.

### Navigating the site with urls
Site navigation should be done through urls as much as possible. It is both faster and less prone to errors. This can be done
using the changeODCPage step method. The mapping for this step method is the following:

I am on the(?: "([^"]+)" tab of the)? "([^"]+)" page(?: using the account "([^"]+)")?$

#### Site Navigation Examples:
I am on the "accounts" tab of the "account management" page using the account "QA_ViralGains",  
I am on the "creatives" tab of the "campaigns" page using the account "QA_ViralGains",  
I am on the "report management" page using the account "QA_ViralGains"

## Email Functionality
We have several gmail accounts for testing user invitation and password reset emails. 

* Current list of test emails:
    * viralgainstestemail@gmail.com 
    * viralGainsTestNoPermissions@gmail.com 
    * viralGainsTestReadPermission@gmail.com 
    * viralgainsTestWritePermissions@gmail.com

viralgainstestemail@gmail.com is the default email used in email related step methods. This can be changed
with the following Gherkin mapping:  
I am logged in to the email account "([^"]*)?"

Example: I am logged in to the email account "viralGainsTestNoPermissions@gmail.com"

Email related Gherkin mappings can be found under src/steps/emailSteps

## Viewing Reports
Cucumber-Salad uses a customized version of the wdio-allure-vg-reporter.  
Reporter: https://www.npmjs.com/package/wdio-allure-vg-reporter

To view reports locally first install this plugin:
https://www.npmjs.com/package/allure-commandline
Then run `npm run allure`

## Additional commands

### multiremoteConfig
Multiremote launches multiple Selenium sessions for a feature file. This allows us to emulate multiple users.
A good explanation of multiremote can be found here: http://webdriver.io/guide/usage/multiremote.html 

The only difference between this command and `npm start` is the configuration files they use. 
`npm start` uses wdio.conf.js, and `npm run multiremoteConfig` uses wdio.multiremote.conf.js.  
A notable difference is that multiremoteConfig only runs features under src/multiremote/multiremoteFeatures, and start
only runs files under src/features.

Example Usage: `npm run multiremoteConfig -- --features=ODC-535andODC-536_CampaignOptimisticLocking.feature`

#### Some notes on multiremote:
* multiremote doesn't show a stack trace.
* Visual Regression Service cannot be used with multiremote : http://webdriver.io/guide/services/visual-regression.html
* Custom Webdriver commands cannot be used with individual browsers. You can however send custom commands to all multiremote browsers.
    * http://webdriver.io/guide/usage/customcommands.html
    * Example: browser.multiremoteIsVisible() will work, but browserA.multiremoteIsVisible() will not.
