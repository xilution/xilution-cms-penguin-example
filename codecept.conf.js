const {setHeadlessWhen} = require('@codeceptjs/configure');

// turn on headless mode when running with HEADLESS=true environment variable
// HEADLESS=true npx codecept run
setHeadlessWhen(process.env.HEADLESS);

exports.config = {
    tests: './tests/e2e/*.spec.ts',
    output: './output/e2e',
    helpers: {
        Puppeteer: {
            url: 'http://localhost:8080',
            show: false
        }
    },
    include: {},
    bootstrap: null,
    mocha: {
        reporterOptions: {
            "codeceptjs-cli-reporter": {
                stdout: "-",
                options: {
                    verbose: true,
                    steps: true,
                }
            },
            mochawesome: {
                stdout: "./output/e2e/console.log",
                options: {
                    reportDir: "./output/e2e",
                    reportFilename: "report"
                },
            },
            "mocha-junit-reporter": {
                stdout: "./output/e2e/console.log",
                options: {
                    mochaFile: "./output/e2e/result.xml"
                },
                attachments: true
            }
        }
    },
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