# Beta Blog

## Get start

To serve an application is require Docker

Command To start docker compose is `npm run start` or `./beta-blog`

## Change host name

By default the application host name is `localhost` but you can change it manually by replace `localhost` with your own host in these files.

`./Ocelot/ocelot.authv2.json`

```jsonc
"UpstreamHeaderTransform": {
        "X-Forwarded-For": "{RemoteIpAddress}",
        "X-Forwarded-Host": "localhost",
        "X-Forwarded-Proto": "https"
      }
```

`./docker-compose.service.gateway.yml`

```yml
environment:
        AUTH_ISSUER: https://localhost/api/auth/v2

```
