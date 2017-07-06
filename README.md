# Siemens Metered Automatic Peak Shaving (MAPS) Backend
## [34.230.153.145](http://34.230.153.145)

This backend aims to provide a cloud-based peak shaving solution for Siemens meters and EVSEs.
Facilitating communications with the respective gateways, this backend aggregates
data from the EVSE chargers and SEM3 meters and performs real-time logic to avoid overconsumption
at peak hours. Clients can register, configure, and monitor peak shaving plans from a web interface.
Meters and chargers are registered using their respective gateways. The gateways also host redundant
logic to ensure that peak shaving occurs even if connectionin to this backend is dropped.

Technology Stack:
* Utilizes Rails 5 and PostgreSQL

* Uses publisher/subscriber service provided by PubNub to enable real time communications with devices

* Performs stream processing using Redis

* Front-end design using React and Bootstrap

## Cloud Architecture
This system is hosted in AWS for staging (not yet implemented) and production.
The Ruby on Rails application runs in an EC2 instance and connects to a PostgreSQL database in an RDS instance.
The same EC2 instance also runs the Redis server.
An Nginx web server integrated with a Phusion Passenger application server is used to serve the Rails application. The gateways communicate with this cloud using the PubNub publisher/subscriber service as well as through the public endpoint.
Visit it at [34.230.153.145](http://34.230.153.145).


## Setting up development environment

If you prefer to use a shell other than BASH, such as ZSH or SH, ensure your configurations go to the correct files (~/.bashrc vs. ~/.zshrc)

### Operating system

The production environment uses Ubuntu 16.04 LTS so we aim to use this operating system for development as well.
Preferably the OS is installed natively in the development computers although VMs will do just fine.
The rest of the guide assumes you are using Ubuntu 16.04 LTS however 14.04 LTS would most likely also work.

### Install rails through rbenv

Use [rbenv](https://github.com/rbenv/rbenv), a command line tool for managing Ruby versions, to install Ruby:

  1. Update local package cache:
  ```bash
  $ sudo apt-get updatesource ~/.bashrc
  ```
  2. Install ruby and rbenv dependencies:
  ```bash
  $ sudo apt-get install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
  ```
  3. Clone the rbenv repository (run this as the user you plan to ruby as, aka not su):
  ```bash
  $ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
  ```
  4. Add rbenv binary to $PATH and automatically load on shell start:
  ```bash
  $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
  $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
  ```
  5. Source rbenv or restart your terminal:
  ```bash
  $ source ~/.bashrc
  ```
  6. Check your installation with the following:
  ```bash
  $ type rbenv
  ```
  You should see something similar to the following if installation succeeded:
  ```bash
  rbenv is a function
  rbenv ()
  {
      local command;
      command="$1";
      if [ "$#" -gt 0 ]; then
          shift;
      fi;
      case "$command" in
          rehash | shell)
              eval "$(rbenv "sh-$command" "$@")"
          ;;
          *)
              command rbenv "$command" "$@"
          ;;
      esac
  }
  ```
  7. Install newest version of ruby build:
  ```bash
  $ git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
  ```
  *You are now ready to install ruby.*

  8. At the time of writing, this application uses Ruby 2.4.1 so install and set as default with:
  ```bash
  $ rbenv install 2.4.1
  $ rbenv global 2.4.1
  ```
  You can double check your Ruby version at any time with `$ ruby -v`

### Install Node.js through NVM
Ruby on Rails requires a Javascript run-time so install the most recent version of node:
  1. Install dependies required by NVM:
  ```bash
  $ sudo apt-get install build-essential libssl-dev
  ```
  2. Download the installation script:
  ```bash
  $ cd
  $ curl -sL https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh -o install_nvm.sh
  ```
  3. Run the script with BASH or the shell of your choice:
  ```bash
  $ bash install_nvm.sh
  ```
  4. Log out and log back in again or source your shell file:
  ```bash
  $ source ~/.profile
  ```
  *You are now ready to install node*
  5. At the time of writing, this application uses v8.1.3, although the most recent version should still work in the future:
  ```bash
  $ nvm install 8.1.3
  ```
  To install the newest available version:
  ```bash
  $ nvm install node
  ```
  NVM automatically uses the most recently installed version. Double check the currently used version with `$ node -v`

### Install Development PostgreSQL database
Ruby on Rails uses a different database for each environment. While the production database resides in the RDS instance in AWS, the development and test databases reside locally on your machine. The application uses PostgreSQL 9 so install it:

  1. Check for security updates and install:
  ```bash
  $ sudo apt-get update
  $ sudo apt-get install postgresql postgresql-contrib
  ```
  2. Enter `psql` as the postgres user and create a role for the application:
  ```bash
  $ sudo -u postgres psql
  > create role peakshaving with createdb login password 'PG_PASSWORD_LOCAL'
  ```
  where `PG_PASSWORD_LOCAL` represents the password that you pick and remember for further configuration once the peak shaving repository has been cloned

### Install Redis server
Since this application requires redis for stream processing of meter data, install it:

  1. Update local package cache:
  ```bash
  $ sudo apt-get updatesource ~/.bashrc
  ```
  2. Install dependencies and binary tester:
  ```bash
  $ sudo apt-get install build-essential tcl
  ```
  3. Redis needs to be built from source so use a temporary directory:
  ```bash
  $ cd /tmp
  ```
  4. Download latest version from this stable URL and upack:
  ```bash
  $ curl -O http://download.redis.io/redis-stable.tar.gz
  $ tar xzvf redis-stable.tar.gz
  $ cd redis-stable
  ```
  5. Compile the source. This may take a while:
  ```bash
  $ make
  ```
  Check the compilation with `make test`, which may also take a while.

  6. If all tests pass, install:
  ```bash
  $ sudo make install
  ```
  *You are now ready to configure redis*

  7. Following convention, create the `/etc/redis` directory and copy over the sample configuration file:
  ```bash
  $ sudo mkdir /etc/redis
  $ sudo cp /tmp/redis-stable/redis.conf /etc/redis
  ```
  8. Make the following tweaks to the configuration file:
  ```bash
  $ sudo nano /etc/redis/redis.config
  ```
  Change the `supervised` directive from `no` to `systemd`:
  ```
  . . .

  # If you run Redis from upstart or systemd, Redis can interact with your
  # supervision tree. Options:
  #   supervised no      - no supervision interaction
  #   supervised upstart - signal upstart by putting Redis into SIGSTOP mode
  #   supervised systemd - signal systemd by writing READY=1 to $NOTIFY_SOCKET
  #   supervised auto    - detect upstart or systemd method based on
  #                        UPSTART_JOB or NOTIFY_SOCKET environment variables
  # Note: these supervision methods only signal "process is ready."
  #       They do not enable continuous liveness pings back to your supervisor.
  supervised systemd

  . . .
  ```
  Select the directory into which Redis will dump persistent data by changing the `dir` directive to `/var/lib/redis`:
  ```
  . . .

  # The working directory.
  #
  # The DB will be written inside this directory, with the filename specified
  # above using the 'dbfilename' configuration directive.
  #
  # The Append Only File will also be created inside this directory.
  #
  # Note that you must specify a directory here, not a file name.
  dir /var/lib/redis

  . . .
  ```
  Save and close the file

  9. Create the systemd unit file:
  ```bash
  $ sudo nano /etc/systemd/system/redis.service
  ```
  Place the following into the file, save and close:
  ```
  [Unit]
  Description=Redis In-Memory Data Store
  After=network.target

  [Service]
  User=redis
  Group=redis
  ExecStart=/usr/local/bin/redis-server /etc/redis/redis.conf
  ExecStop=/usr/local/bin/redis-cli shutdown
  Restart=always

  [Install]
  WantedBy=multi-user.target
  Install postgresql and create user
  ```
  10. Create the user, group, and directory referenced in previous files (setting appropriate permissions):
  ```bash
  $ sudo adduser --system --group --no-create-home redis
  $ sudo mkdir /var/lib/redis
  $ sudo chown redis:redis /var/lib/redis
  $ sudo chmod 770 /var/lib/redis
  ```
  11. Start the Redis service:
  ```bash
  $ sudo systemctl start redis
  ```
  Check to make sure no errors occurred:
  ```bash
  $ sudo systemctl status redis
  ```
  should produce something similar to the following output:
  ```
  Output
  ● redis.service - Redis Server
   Loaded: loaded (/etc/systemd/system/redis.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2016-05-11 14:38:08 EDT; 1min 43s ago
  Process: 3115 ExecStop=/usr/local/bin/redis-cli shutdown (code=exited, status=0/SUCCESS)
 Main PID: 3124 (redis-server)
    Tasks: 3 (limit: 512)
   Memory: 864.0K
      CPU: 179ms
   CGroup: /system.slice/redis.service
           └─3124 /usr/local/bin/redis-server 127.0.0.1:6379       

  . . .   
  ```
  12. Enable Redis to start at boot:
  ```bash
  $ sudo systemctl enable redis
  ```
  You can test Redis functionality at any time with the command line interface `$ redis-cli`

## Cloning Repository and Starting Development

## Setting Environment Variables
## Deployment
