clean:
	rm -rf db site output

lint:
	npx tslint -p tsconfig.json -c tslint.json

start:
	docker compose up --build -d

stop:
	docker compose down

open:
	open http://localhost:8080

e2e-tests:
	bash ./scripts/start-server.sh
	bash ./scripts/run-e2e-tests.sh http://localhost:8080 /Applications/Chromium.app/Contents/MacOS/Chromium
	bash ./scripts/stop-server.sh

e2e-test-report:
	open ./output/e2e/report.html

load-tests:
	bash ./scripts/start-server.sh
	bash ./scripts/run-load-tests.sh http://localhost:8080
	bash ./scripts/stop-server.sh

load-test-report:
	open ./output/load/report.html
