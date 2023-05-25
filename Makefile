phony: build

build:
	@echo "Building for production..."
	@bundle install
	@bundle exec rake db:migrate
