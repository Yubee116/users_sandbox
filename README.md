# Prerequisites

The app requires Postgres and Redis to be availbale on the local machine. Please get them and start their services.
- [Get Postgres](https://www.postgresql.org)
- [Get Redis](https://redis.io/docs/getting-started/)

<br>

Postgres and Redis are available/listen on ports 5432 and 6379 respectively, by default, so the app has been configured to connect throuh those ports. However, you can modify the app's configs to suit your environment.
- [Postgres config](https://github.com/Yubee116/users_sandbox/blob/main/config/database.yml)
- [Redis config](https://github.com/Yubee116/users_sandbox/blob/main/config/sidekiq.rb) 

You can also provide connection credentials (username/password) where applicable
# Running Tests
TO DO

# Running the app
1. Clone this repository and change directory
```
$ git clone https://github.com/Yubee116/users_sandbox.git
$ cd users_sandbox 
```  

2. Run `bundle install`

3. Start Sidekiq as a separate process using the command `bundle exec sidekiq --environment development -C config/sidekiq.yml`. This is needed here because seeding the database uses jobs

4. Prepare the database: create, migrate and seed
```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

5. Start the sever by running the command `bin/dev`

