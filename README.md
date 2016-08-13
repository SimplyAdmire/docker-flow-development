Flow Development environment
============================

This development environment is a docker-compose base setup that can be
used for Flow / Neos development. It contains a base configuration and
a list of shell scripts to manage the environment.

### Commands

`bin/start`: Start the docker environment

`bin/stop`: Stop the docker environment

`bin/composer <command>`: Run composer

`bin/flow <command>`: Run Flow CLI

### Advanced commands

If you want to run more advanced commands you can have a look at the shell
scripts in `Environment/bin/` folder. Most important scripts here are import
scripts for the mysql and `Environment/bin/docker-compose.sh <docker-compose command>`.

It is possible to run `docker-compose` directly, but make sure you've loaded the right
environment variables and docker-compose.yml files then.

### Adding your code

The environment assumes a Flow installation in the `./app/` folder. You
can override the configuration if you want to use another path.

### (Extending) configuration

The environment separates the webserver setup from the development build
tools like composer and npm. The environment is set in `Environment/docker-compose.yml`
with `Environment/docker-compose.override.yml` to add development features.

If you want to override the `docker-compose.yml` config you can do so in the
`./app/Build/Environment/` folder. Make sure you use the same relative path as
the file you want to override. So if you want to override the configuration in
`Environment/docker-compose.yml` you should use the file 
`./app/Build/Environment/docker-compose.yml`. Additionally you can use a
`./app/Build/Environment/docker-compose.override.yml` file in case you need it.
This can be useful if you want to have a project specific configuration, and
still want your developers to have freedom.

### Environment vars in .env

To use environment variables we use `.env` files which are loaded in order. First
the file `Environment/.env` is loaded, followed by the `./app/Build/Environment/.env`
file which is required to exist. Optionally the file `./app/Build/Environment/.env.local`
is loaded (only if it exists) so a developer can have custom configuration.
