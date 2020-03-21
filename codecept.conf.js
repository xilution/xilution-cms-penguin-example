const {setHeadlessWhen} = require('@codeceptjs/configure');

// turn on headless mode when running with HEADLESS=true environment variable
// HEADLESS=true npx codecept run
setHeadlessWhen(process.env.HEADLESS);

exports.config = {
    tests: './test/e2e/*.spec.ts',
    output: './output',
    helpers: {
        Puppeteer: {
            url: 'http://localhost:8080',
            show: false
        }
    },
    include: {},
    bootstrap: null,
    mocha: {},
    name: 'xilution-wordpress-docker',
    require: ["ts-node/register"],
    plugins: {
        retryFailedStep: {
            enabled: true
        },
        screenshotOnFail: {
            enabled: true
        }
    }
};
