var {defineSupportCode} = require('cucumber');

defineSupportCode(function ({And, But, Given, Then, When}) {
    Given(/^I use contents of json file (.*)$/, function (file, callback) {
        this.apickli.pipeFileContentsToRequestBody(file, function (error) {
            if (error) {
                callback(new Error(error));
            }

            callback();
        });
    });
    When(/^I do POST to url (.*)$/, function (resource, callback) {
        this.apickli.post(resource, function (error, response) {
            if (error) {
                callback(new Error(error));
            }

            callback();
        });
    });
});