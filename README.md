**Command line instructions**

You can also upload existing files from your computer using the instructions below.


**Git global setup**
```
git config --global user.name "Tashi Dendup"
git config --global user.email "tashi.dendup@dcpl.bt"
```

**Create a new repository**
```
git clone git@gitlab.dcpl.bt:dcpl/undp-api.git
cd undp-api
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

**Push an existing folder**
```
cd existing_folder
git init
git remote add origin git@gitlab.dcpl.bt:dcpl/undp-api.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

**Push an existing Git repository**
```
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.dcpl.bt:dcpl/undp-api.git
git push -u origin --all
git push -u origin --tags
```

# README

This app is the backend for alfa Health. It is a dockerized Ruby on Rails application.

### Overview

The Docker configuration consists of three images:
* Nginx, running as a reverse proxy. This is not as critical for local development, but its used for our configuration on Elastic Beanstalk on AWS, which is where this app is deployed.
* A PostgresQL database. This is used for local development. In staging and in production, we use a Postgres database hosted via RDS on AWS.
* The Ruby on Rails app contained within this repo. This makes up the core of our application. We use ruby version 3.1.2, and rails 7. For more info on rails, see the [rails guides](https://guides.rubyonrails.org/).

### Setup

* Start by git cloning this repo.
* Install docker compose, which you can find [here](https://docs.docker.com/compose/install/).
* Run `docker-compose up -d` from the root directory of this project. If you run into issues with accessing the local database, it's good to confirm that your creds are set up as displayed [here](https://github.com/rkadyb/alfalfa-api/commit/e27a1930ffb642c2f020e0ebb3d84570f24f572f#diff-e45e45baeda1c1e73482975a664062aa56f20c03dd9d64a827aba57775bed0d3).

### Helpful Commands

#### view docker processes
```docker ps```

#### launch interactive bash on that running container
```docker exec -it $( docker ps | grep app | awk "{print \$1}" | head -n 1 ) bash```

#### launch interactive rails console on that running container
```docker exec -it $( docker ps | grep app | awk "{print \$1}" | head -n 1 ) rails c```

#### or if you don't have global bundler in that container
```docker exec -it $( docker ps | grep app | awk "{print \$1}" | head -n 1 ) bin/rails c```

#### to run daemonized rake task in the container
```docker exec -d $( docker ps | grep app | awk "{print \$1}" | head -n 1 ) bin/rake db:migrate```

#### to run daemonized rails runner
```docker exec -d $( docker ps | grep app | awk "{print \$1}" | head -n 1 ) bin/rails runner 'User.all.find_each {|u| u.do_something! }'```

#### create and start containers
```docker-compose up --build```

### Miscellaneous

This app uses [rswag](https://github.com/rswag/rswag) to generate Swagger Docs for the API.
