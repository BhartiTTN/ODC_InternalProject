const PageTests = {
  'AdUnitOverview'() {
    waitForTitleIncludes('Ad Units Page', 'Ad Units for');
  },
  'CampaignCanvas'() {
    waitForUrlIncludes('Campaign Canvas Page', '/campaign?')
  },
  'CampaignOverview'() {
    waitForTitleIncludes('Campaign Overview Page', 'Campaigns for');
  },
  'ControlPanel' () {
    waitForUrlIncludes('Control Panel','/panel');
  },
  'CreateNewCampaign'() {
    waitForTitleIncludes('Create New Campaign Page', 'New Campaign');
  },
  'Creative'() {
    waitForTitleIncludes('Creative Page', 'Video to Promote');
  },
  'CreateOrg'() {
    waitForTitleIncludes('CreateOrg Page', 'New Organization');
  },
  'Dashboard'() {
    waitForTitleEquals('Dashboard Page', 'Viralgains Dashboard');
  },
  'Login'() {
    waitForTitleEquals('Login Page', 'Login to ViralGains');
  },
  'MediaPlan'() {
    waitForTitleIncludes('Media Plan Page', 'Media Plan for');
  },
  'NewOrganization'() {
    waitForTitleEquals('New Organization Page', 'New Organization | ViralGains');
  },

  'ShareLanding'() {
    waitForTitleEquals('ShareLanding Page', 'Preview for VPAID Ad-Unit');
  },
  'StaffPortal'() {
    waitForTitleEquals('Staff Portal Page', 'Staff Portal');
  },
  'SurveyEdit'() {
    waitForTitleEquals('Survey Edit Page', 'Survey Setup');
  },
  'SurveysOverview'() {
    waitForTitleIncludes('Surveys Overview', 'Surveys for');
  },
  'Targeting'() {
    waitForTitleIncludes('Targeting Page', 'Audience for');
  },
  'ODCDashboard'() {
    // TODO: Commenting title validation, as currently all pages have same title. So instead we should be using url check. Once we have different title for all pages, we can bring back this validation.
    // waitForTitleEquals('ODCDashboard Page', 'ViralGains');
    waitForUrlIncludes('ODCDashboard Page', '/dashboard/accounts');
  },
  'ODCLogin'() {
    waitForTitleEquals('ODCLogin Page', 'ViralGains');
  },
  'ODC-Creative'() {
    waitForTitleEquals('ODC-Creative Page', 'ViralGains');
  },
  'ODC-Campaign_Dashboard'() {
    waitForTitleEquals('ODC-Campaign_Dashboard', 'ViralGains');
  },

  'ODCAccountManagement'() {
    waitForTitleEquals('ODCAccountManagement Page', 'ViralGains');
  },

  'PasswordReset'() {
    waitForTitleEquals('PasswordReset Page', 'ViralGains');
  },

  'ChangePassword'() {
    waitForTitleEquals('ChangePassword Page', 'ViralGains');
  },

  'ReportBuilder'() {
    waitForUrlIncludes('ReportBuilder Page', 'report-builder');
  },

  'ReportViewer'() {
    waitForUrlIncludes('ReportViewer Page', 'report-viewer');
  },

  'Campaigns'() {
    waitForUrlIncludes('Campaigns Page', '/campaigns');
  }



};

function waitForTitleEquals(pageName, expectedTitle) {
  browser.waitUntil(() => checkTitleEquals(expectedTitle), browser.options.waitforTimeout, `Expected title to equal "${expectedTitle}" to ensure we're on the ${pageName}`);
}
function waitForTitleIncludes(pageName, expectedTitle) {
  browser.waitUntil(() => checkTitleIncludes(expectedTitle), browser.options.waitforTimeout, `Expected title to contain "${expectedTitle}" to ensure we're on the ${pageName}`);
}

function waitForUrlIncludes(pageName, expectedUrl) {
  browser.waitUntil(()=> checkUrlIncludes(expectedUrl), browser.options.waitforTimeout, `Expected url to contain "${expectedUrl} to ensure we're on the ${pageName}`);
}

function checkTitleEquals(expectedTitle) {
  const title = browser.getTitle();
  return title === expectedTitle;
}

function checkTitleIncludes(expectedTitle) {
  const title = browser.getTitle();
  return title.includes(expectedTitle);
}

function checkUrlIncludes(expectedUrl) {
  const url = browser.getUrl();
  return url.includes(expectedUrl);
}

/**
 * Check the page characteristics based on known page names
 * @param  {String}   pageName   The name of the page to check, based on heuristics
 * @param  {Function} done        Function to execute when finished
 */
module.exports = (pageName, done) => {
  const testFunction = PageTests[pageName.replace(/ /g, '')];

  expect(testFunction).not.to.equal(undefined, `Requested page to test is unknown ${pageName}`);
  testFunction();

  done();
};
