# DB_URL=postgresql://root:mypass@localhost:5432/simple_bank?sslmode=disable

createdb:
	docker compose exec -it postgres createdb --username=simplebank --owner=simplebank simplebank_db

dropdb:
	docker compose exec -it postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1
	
new_migration:
	migrate create -ext sql -dir db/migration -seq $(name)

sqlc:
	sqlc generate

test:
	go test -v -cover ./...