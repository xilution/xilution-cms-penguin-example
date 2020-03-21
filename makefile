clean:
	bash ./scripts/clean.sh

start:
	bash ./scripts/start.sh

stop:
	bash ./scripts/stop.sh

open:
	bash ./scripts/open.sh

test-e2e:
	bash ./scripts/run-e2e-tests.sh http://localhost:8080

lint:
	bash ./scripts/lint.sh
