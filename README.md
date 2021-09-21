# MyApp.Umbrella
Taken from several sources, then modified slightly to be simpler and work with
more modern Phoenix / Elixir conventions, [medium](https://medium.com/@cedric_paumard/how-to-build-multiple-web-apps-with-elixir-thanks-to-umbrella-part-2-set-up-the-project-800d6d731dbd), [pentacent](https://pentacent.medium.com/getting-started-with-elixir-docker-982e2a16213c), [cloud.google](https://cloud.google.com/community/tutorials/elixir-phoenix-on-kubernetes-google-container-engine).

- install Docker, docker-compose
- `docker build -t my_app_umbrella:0.1.0 .`
- `cp my_app_umbrella/.env.dist my_app_umbrella/.env`. At this point, you can
  update the values of `PSQL_USER` and `PSQL_PWD` in `.env` as you will need to
  pass these values in through the command line later. You should also set
  `PSQL_HOST = postgres`. The reason we can do this is because we specified in
  the docker-compose.yml file that we have a service by this name. So,
  `postgres` will resolve to whatever ip the container has once it has one.
- Manually create database instead of with Mix...
  - `docker-compose up -d postgres`
  - `docker-compose exec postgres psql some_user`. Note that `some_user` should
  be the value that you put into the `.env` file for `PSQL_USER`. Similarly, the
  Postgres create commands below should use the values of `POSTGRES_DB_DEV` and
  `PSQL_DB_TEST`
    - `CREATE DATABASE my_app_dev;`
    - `CREATE DATABASE my_app_test;`
    - verify that you see the two new databases via running `\l`
    - `\q`
  - `docker-compose stop`
- `docker-compose build`
- `docker-compose up -d postgres`
- `docker-compose up elixir`
- Visit http://localhost:4001/
