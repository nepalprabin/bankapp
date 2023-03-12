postgres:
	docker run --name postgres1 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:15-alpine

createdb:
	docker exec -it postgres1 createdb --username=root --owner=root bankapp

dropdb:
	docker exec -it postgres1 dropdb bankapp

migrateup:
	migrate --path db/migration --database "postgresql://root:secret@localhost:5432/bankapp?sslmode=disable" --verbose up

migratedown:
	migrate --path db/migration --database "postgresql://root:secret@localhost:5432/bankapp?sslmode=disable" --verbose down


 .PHONY: postgres createdb dropdb migrateup migratedown
