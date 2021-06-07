##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.5.5]
- Rails [6.1.3]

##### 1. Check out the repository

```bash
$ git clone git@github.com:pwenig/social_scanner.git
$ cd social_scanner
$ bundle install
```

##### 2. Create and setup the database

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
```

##### 4. Run tests
```ruby
bundle exec rspec
```

##### 4. Start the Rails server

```ruby
bundle exec rails s
```

#### 5. Scan the social networks
```ruby
curl localhost:3000
```
