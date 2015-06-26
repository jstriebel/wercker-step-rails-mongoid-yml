#!/usr/bin/env bash

main() {
  local mongoid_yml_path="$PWD/config/mongoid.yml"

  if [ -f "$mongoid_yml_path" ]; then
    debug 'config/database.yml already exists and will be overwritten'
  fi

  if [ -z "$MONGO_PORT_27017_TCP_ADDR" ]; then
    warn "MONGO_PORT_27017_TCP_ADDR env var for the mongo service is not set"
    return
  fi

  if [ -z "$MONGO_PORT_27017_TCP_PORT" ]; then
    warn "MONGO_PORT_27017_TCP_ADDR env var for the mongo service is not set"
    return
  fi

  if [ -z "$WERCKER_RAILS_MONGOID_YML_DB_NAME" ]; then
    local db_name_default='mongoid'
    debug "option db_name not set, defaulting to $db_name_default"
    export WERCKER_RAILS_MONGOID_YML_DB_NAME="$db_name_default"
  fi

  info "Auto detecting service"

  fail 'Unable to auto detect service; please set "service" option'

  info "Generating mongoid.yml template"
  tee "$mongoid_yml_path" << EOF
test:
  sessions:
    default:
      database: <%= ENV['WERCKER_RAILS_MONGOID_YML_DB_NAME'] %>
      hosts:
        - <%= ENV['MONGO_PORT_27017_TCP_ADDR'] %>:<%= ENV['MONGO_PORT_27017_TCP_PORT'] %>
EOF
}

main;
