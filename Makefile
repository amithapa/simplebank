postgres:
	sudo docker run --name some-pg --rm -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=mypass postgres:13.0-alpine

createdb:
	sudo docker container exec -it some-pg createdb --username=root --owner=root simple_bank

dropdb:
	sudo docker container exec -it some-pg dropdb simple_bank

migrateup:
	migrate -path db/migration/ -database "postgresql://root:mypass@localhost:5432/simple_bank?sslmode=disable" --verbose up

migratedown:
	migrate -path db/migration/ -database "postgresql://root:mypass@localhost:5432/simple_bank?sslmode=disable" --verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test