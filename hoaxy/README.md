Create Hoaxy db:
```
docker run --name hoaxy-psql -itd --restart always \
  --publish 5432:5432 \
  --volume /srv/docker/postgresql:/var/lib/postgresql \
  --env 'PG_TRUST_LOCALNET=true' \
  --env 'DB_USER=hoaxy' --env 'DB_PASS=pizza' \
  --env 'DB_NAME=hoaxy' \
  sameersbn/postgresql:9.6-2
```
