start:
	docker-compose up --build -d

stop:
	docker-compose down

clean:
	rm -rf db site

open:
	open http://localhost:8080
