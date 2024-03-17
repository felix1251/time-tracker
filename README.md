# README

[Deployed Website](https://tracking.felixabacajen.info)

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

Spawn containers

```
docker compose -f docker-compose.dev.yml up -d
```

> We control all the commands inside our time_tracker_container.
> All logic or changes will reflect in our project directory because volume are shared between our container

Local server (this is served from our docker container)

```
http://127.0.0.1:3000/
```

Open rails project container

```
docker exec -it time_tracker_container bash
```

> After successful docker container execution we can now run rails commands on it

Execution (Example Only)

```bash
root@a122740347d3:/app# rails console
Loading development environment (Rails 7.0.8.1)
irb(main):001> User.all
```

### Test Account

Admin User

```
email: admin@example.com
password: test@123
```

Normal User

```
email: test@example.com
password: test@123
```

### HTML to HAML

```
HAML_RAILS_DELETE_ERB=true rails haml:erb2haml
```
