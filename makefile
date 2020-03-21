clean:
	rm -rf db site

start:
	docker-compose up --build -d

stop:
	docker-compose down

open:
	open http://localhost:8080
