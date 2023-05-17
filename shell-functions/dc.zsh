dc () {
  if [ -f 'docker-compose.local.yml' ]
  then
  	eval "docker compose -f docker-compose.local.yml $@"
  else
  	eval "docker compose $@"
  fi
}
