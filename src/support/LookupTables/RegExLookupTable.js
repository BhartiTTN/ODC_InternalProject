/**
 * Created by hkodey on 01/13/18.
 */

const RegExLookupTable = {

  'Rows Number': /^[0-9]+[\s]+[-]+[\s]+[0-9]+[\s]+[of]+[\s]+(\d+)?$/,
  'Delete Confirmation Message' : /^Are you sure you want to delete all selected (?:accounts|users|creatives) \((\d+)\)\?$/,
  'Header Text Character Count' :/(\d+)\/(\d+)$/,
  'Line2 Character Count' :/(\d+)\/(\d+)$/,
  'Line3 Character Count' :/(\d+)\/(\d+)$/,
  'CTA Message Character Count' :/(\d+)\/(\d+)$/,
  'CTA Button Character Count' :/(\d+)\/(\d+)$/,

};

function findRegEXInTable(key) {

  if (key in RegExLookupTable) {
    return RegExLookupTable[key];
  }
  return null;
}

module.exports = {
  RegExLookupTable,
  findRegEXInTable,
};
