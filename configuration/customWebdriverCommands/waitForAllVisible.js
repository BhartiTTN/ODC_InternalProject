/**
 * Created by adamShanahan on 6/4/18.
 */
module.exports = (selector, timeout, falseCase) => {
  if (usingMultiremote()) {
    return multiremoteWaitForAllVisible(selector, browserA.options.waitforTimeout, falseCase);
  }
  return waitForAllVisible(selector, timeout, falseCase);
};


function waitForAllVisible(selector, timeout, falseCase) {
  return browser.waitUntil(() => {
    const isVisible = browser.isVisible(selector);
    if (Array.isArray(isVisible)) {
      return isVisible.every((visibility) => visibility ^ falseCase);
    }
    return isVisible ^ falseCase;
  }, timeout);
}

function multiremoteWaitForAllVisible(selector, timeout, falseCase) {
  return browser.waitUntil(() => {
    const isVisibleA = browserA.isVisible(selector);
    const isVisibleB = browserB.isVisible(selector);
    if (Array.isArray(isVisibleA)) {
      return isVisibleA.every((visibility) => visibility ^ falseCase) && isVisibleB.every((visibility) => visibility ^ falseCase);
    }
    return (isVisibleA && isVisibleB) ^ falseCase;
  }, timeout);
}


// Webdriver returns an object of { browserA: title, browserB: title} if multiremote is running
function usingMultiremote() {
  return typeof browser.getTitle() === 'object';
}
