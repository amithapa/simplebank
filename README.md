```bash
migrate create -ext sql -dir db/migration -seq init_schema
```

```bash
migrate -path db/migration -database "postgresql://simplebank:myadmin@localhost:5542/simplebank_db?sslmode=disable" -verbose up
```