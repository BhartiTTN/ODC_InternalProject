const singleton = Symbol();
const singletonEnforcer = Symbol();

// TODO: Add an explanation for what this is. What requests?

export default class CurrentRequests {
  constructor(enforcer) {
    if (enforcer !== singletonEnforcer) {
      throw 'Cannot construct singleton';
    }
    this.req = null;
  }

  static getInstance() {
    if (!this[singleton]) {
      this[singleton] = new CurrentRequests(singletonEnforcer);
    }
    return this[singleton];
  }

  static destroyInstance() {
    delete this[singleton];
  }

  setRequestArray(reqArr) {
    this.reqArr = reqArr;
  }

  getRequestArray() {
    return this.reqArr;
  }
}
