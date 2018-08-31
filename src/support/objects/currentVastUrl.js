/**
 * Created by adamShanahan on 8/30/17.
 * Updated by hkodey on 9/18/17.
 */
const singleton = Symbol();
const singletonEnforcer = Symbol();

export default class CurrentVastUrl {
  constructor(enforcer) {
    if (enforcer !== singletonEnforcer) {
      throw 'Cannot construct singleton';
    }
    this.vastUrl = null;
    this.vastId=null;
  }

  static getInstance() {
    if (!this[singleton]) {
      this[singleton] = new CurrentVastUrl(singletonEnforcer);
    }
    return this[singleton];
  }

  static destroyInstance() {
    delete this[singleton];
  }

  setVastUrl(vastUrl) {
    this.vastUrl = vastUrl;
    this.setVastId();
  }

  getVastUrl() {
    return this.vastUrl;
  }
  setVastId() {
    this.vastId = this.vastUrl.substring(32,68);
  }
  getVastId() {
    return this.vastId;
  }
}
