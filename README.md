# simplebank

```bash
sudo docker run --name some-pg --rm -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=mypass postgres:13.0-alpine
```

```bash
migrate create -ext sql -dir db/migration -seq init_schema
```

``bash
migrate -path db/migration/ -database "postgresql://root:mypass@localhost:5432/simple_bank?sslmode=disable" --verbose up
```