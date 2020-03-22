clean:
	bash ./scripts/clean.sh

start:
	bash ./scripts/start.sh

stop:
	bash ./scripts/stop.sh

open:
	open http://localhost:8080

e2e-tests:
	bash ./scripts/run-e2e-tests.sh http://localhost:8080

e2e-test-report:
	open ./output/e2e/report.html

load-tests:
	bash ./scripts/run-load-tests.sh http://localhost:8080

load-test-report:
	open ./output/load/report.html

lint:
	bash ./scripts/lint.sh
