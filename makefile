clean:
	rm -rf db site output

lint:
	tslint -p tsconfig.json -c tslint.json

start:
	docker-compose up --build -d

stop:
	docker-compose down

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
