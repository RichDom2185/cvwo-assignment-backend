.PHONY: build deps dev migrateDBs

build: deps migrateDBs

migrateDBs:
	@echo "Migrating databases..."
	@bundle exec rake db:migrate
deps:
	@echo "Installing dependencies..."
	@bundle install
dev:
	@echo "Starting development server..."
	@bundle exec rails server
