import imaps from 'imap-simple';
import cheerio from 'cheerio';
import quotedPrintable from 'quoted-printable';
import utf8 from 'utf8';
import sleep from 'system-sleep';
import {getVariable, setVariable} from '../../../LookupTables/storedVariables';

const config = {
  imap: {
    user: 'viralgainstestemail@gmail.com', // viralgainstestemail@gmail.com, viralGainsTestNoPermissions@gmail.com, viralGainsTestReadPermission@gmail.com, viralgainstestwritepermissions@gmail.com
    password: 'nerfguncup7',
    host: 'imap.gmail.com',
    port: 993,
    tls: true,
    authTimeout: 3000
  }
};


function getMostRecentEmailSearchCriteria(subject) {
  const mostRecentEmailSearchCriteria = [
    ['FROM', 'tu@viralgains.com'],
    'Unseen',
    ['SUBJECT', subject]];
  return mostRecentEmailSearchCriteria;
}

const fetchOptions = {
  bodies: ['TEXT'],
  markSeen: true
};
function getExpiredPasswordCriteria() {
  const delay = 2 * 24 * 3600 * 1000;
  const twoDaysAgo = new Date(Date.now() - delay);

  return [
    ['FROM', 'tu@viralgains.com'],
    ['BEFORE', twoDaysAgo],
    // Subject needs to be updated after FINAL REQUIREMENTS by Product or Adops
    ['SUBJECT', 'Change Password']];
}

module.exports = {
  setEmailUser,
  testAccountInvitationEmail,
  testExpiredAccountInvitationEmail,
  testOrganizationInvitationEmail,
  testResetPasswordEmail,
  testExpiredPasswordResetEmail
};

function setEmailUser(user, done) {
  config.imap.user = user;
  done();
}

function testAccountInvitationEmail(account, done) {
  account = (account === 'New Account Name') ? getVariable(account) : account;

  const mostRecentEmailSearchCriteria = getMostRecentEmailSearchCriteria('ViralGains Invitation');

  return getInboxConnection().then((connection) => {
    return pollInbox(connection, Date.now(), mostRecentEmailSearchCriteria, fetchOptions,'', account).then((mostRecentEmail) => {
      connection.end();
      setEmailLink(getEmailText(mostRecentEmail), 'a');
      done();
    });
  });
}



function testExpiredAccountInvitationEmail(accountName, done) {
  const searchCritera = [['FROM', 'tu@viralgains.com'], ['SUBJECT', 'ViralGains Invitation'], ['SINCE', Date.now()]];

  return getInboxConnection().then((connection) => {
    return getExpiredEmail(connection, searchCritera, fetchOptions, accountName).then((mostRecentEmail) => {
      connection.end();
      setEmailLink(getEmailText(mostRecentEmail), 'a');
      done();
    });
  });
}

// Used with the old VG platform
function testOrganizationInvitationEmail(organization, done) {
  const mostRecentEmailSearchCriteria = getMostRecentEmailSearchCriteria('Invitation from ViralGains');

  return getInboxConnection().then((connection) => {
    return pollInbox(connection, Date.now(), mostRecentEmailSearchCriteria, fetchOptions, '', organization).then((mostRecentEmail) => {
      connection.end();
      setEmailLink(getEmailText(mostRecentEmail), '#joinOrganizationLink');
      done();
    });
  });
}

function testResetPasswordEmail(done) {
  const mostRecentEmailSearchCriteria = getMostRecentEmailSearchCriteria('Change Password');

  return getInboxConnection().then((connection) => {
    return pollInbox(connection, Date.now(), mostRecentEmailSearchCriteria, fetchOptions, '').then((mostRecentEmail) => {
      connection.end();
      setEmailLink(getEmailText(mostRecentEmail), 'a');
      done();
    });
  });
}

// tests password reset email from at least 24 hours ago
function testExpiredPasswordResetEmail(done) {
  return getInboxConnection().then((connection) => {
    return getExpiredEmail(connection, getExpiredPasswordCriteria(), fetchOptions).then((mostRecentEmail) => {
      connection.end();
      setEmailLink(getEmailText(mostRecentEmail), 'a');
      done();
    });
  });
}

function getInboxConnection() {
  return imaps.connect(config).then(function (connection) {
    return connection.openBox('INBOX').then(() => {
      return Promise.resolve(connection);
    });
  });
}

function pollInbox(connection, startTime, searchCriteria, fetchOptions, failureReason, bodySearchString) {
  assert.isBelow(Date.now() - startTime, 15000, `no email received in the last 15 seconds passed test, last test failed for: ${  failureReason}`);

  return getEmail(connection, searchCriteria, fetchOptions, bodySearchString).catch((err) => {
    sleep(1000);
    return pollInbox(connection, startTime, searchCriteria, fetchOptions, err, bodySearchString);
  });
}

/**
 * Returns the most recent email that fulfills a given searchCriteria
 * @param connection       {Object} Connection for Imap-simple library
 * @param searchCriteria   {String} searchCriteria used for Imap-simple library.
 * @param fetchOptions     {String}fetchOptions used for Imap-simple library.
 * @param bodySearchString {String} Email must contain this string to be valid. Examples are the name of an organization or account. This argument is optional
 * @returns {Promise.<TResult>} Returns the most recent email that passes these tests
 */
function getEmail(connection, searchCriteria, fetchOptions, bodySearchString) {
  const [, subject] = searchCriteria.find((element) => Array.isArray(element) && element[0] === 'SUBJECT');
  const errorMessage = getEmailErrorMessage(subject, bodySearchString);

  return connection.search(searchCriteria, fetchOptions).then(function (results) { // TODO: Update error with bodySearchString
    let recentEmails = results.filter(checkIfFromLastTwoMinutes);

    if (bodySearchString) {
      recentEmails = recentEmails.filter((email)=>checkBodyIncludesString(email, bodySearchString));
    }

    expect(recentEmails, errorMessage).to.not.be.empty;

    const mostRecentEmail = recentEmails[recentEmails.length - 1];
    return mostRecentEmail;
  });
}

function getEmailErrorMessage(subject, bodySearchString) {
  let errorMessage = 'no unseen emails';

  if (bodySearchString) {
    errorMessage +=` with body containing "${bodySearchString}"`;
  }
  return `${errorMessage} from "tu@viralgains.com" with Subject "${subject}" were found`
}


function getExpiredEmail(connection, searchCriteria, fetchOptions, bodySearchString) {
  const [, subject] = searchCriteria.find((element) => Array.isArray(element) && element[0] === 'SUBJECT');

  return connection.search(searchCriteria, fetchOptions).then(function (results) {
    expect(results, `no unseen emails from "tu@viralgains.com" with Subject "${subject}" were found`).to.not.be.empty;

    if (bodySearchString) {
      results = results.filter((email)=>checkBodyIncludesString(email, bodySearchString));
    }

    const oldEmail = results[results.length - 2];
    return oldEmail;
  });
}


function getEmailText(email) {
  return email.parts.find((part) => part.which === 'TEXT').body;
}

function checkIfFromLastTwoMinutes(email) {
  const emailDate = new Date(email.attributes.date);
  const delay = 60 * 1000 * 2;
  const lastMinute = new Date(Date.now() - delay);

  return emailDate - lastMinute > 0;
}

function checkBodyIncludesString(email, expectedString) {
  const body = getEmailText(email);
  return body.includes(expectedString);
}

// grabs url with given selector, and saves it for use with 'When I click on the email link' mapping
function setEmailLink(message, selector) {
  const decodedMessage = utf8.decode(quotedPrintable.decode(message));
  const $ = cheerio.load(decodedMessage);

  const url = $(selector).attr('href');
  setVariable('currentEmailLink', url);
}
