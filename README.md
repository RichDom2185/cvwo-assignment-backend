# thing.do backend

Available on Render: [https://thing-do-api.onrender.com](https://thing-do-api.onrender.com)

*Note that the above is the API. To access the frontend, visit [https://thing-do.netlify.app](https://thing-do.netlify.app).*

Made by:

* **Name:** Richard Dominick
* **Matriculation Number:** A0240554L

## Getting started

### Setting up the server

#### Install dependencies locally

Create a configuration file `.bundle/config` with the following contents:

```yaml
---
BUNDLE_PATH: ".bundle"
```

Then run the following command to install dependencies:

```bash
bundle install
```

#### Environment Variables

Make a copy of `.env.example`, call it `.env`, and fill up your environment variable values.

#### Rails setup

Run the following commands to set up the database:

```bash
bundle exec rails db:create
bundle exec rails db:migrate
```

Optionally, seed the database:

```bash
bundle exec rails db:seed
```

### Run the server locally

```bash
bundle exec rails server
```

## Upgrading the ruby version

Follow this [guide](https://guides.rubyonrails.org/upgrading_ruby_on_rails.html), substituting `rails` with `bundle exec rails` where necessary.

## Using Docker

Optionally, a containerized PostgreSQL instance can be used as defined in the `docker-compose.yml` file.

To start, run:

```bash
docker compose up -d
```

To stop and keep files, run:

```bash
docker compose stop
```

To stop and delete files, run:

```bash
docker compose down
```
