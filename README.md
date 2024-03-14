# README

## Setup Dev Environment

Copy ENV

```
cp .env.example .env
```

### Dockerize

Build

```
docker compose -f docker-compose.dev.yml build
```

Initialize

```
docker compose -f docker-compose.dev.yml up -d
```

> We control all the commands inside our time_tracker_container
> All logic or changes will reflect in our project directory because volume are shared between our container

```
docker exec -it time_tracker_container bash
```

> After successful docker container execution we can now run rails commands on it

### HTML to HAML

```
HAML_RAILS_DELETE_ERB=true rails haml:erb2haml
```
