start:
	docker-compose up --build -d

stop:
	docker-compose down

clean:
	rm -rf database html

open:
	open http://localhost:8000
