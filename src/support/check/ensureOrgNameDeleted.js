/**
 * Navigates to the staff organizations page and attempts to delete the following name from the first page.
 * @param  {String}   orgName The name of the organization we want to delete, if one exists.
 * @param  {Function} done Function to execute when finished
 */
module.exports = (orgName, done) => {
  const url = `https://qa2.viralgains.com/vg/staff/reporting?report=organizations&search=${orgName}`;

  browser.url(url);
  browser.pause(4000);

  browser.execute(`
    var el = $(":contains('AutoEnterOrganizationName'):last").parent().siblings().first().find('input');
    if(el.length > 0) {
        el.click();
        $('a.editOrganizations').click();
        $('#confirm').click();
    }
    `);

  done();
};

