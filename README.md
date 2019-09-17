# BlogBoi

BlogBoi is a rails gem / engine that provides out-of-the-box blogging functionality to your rails application

## A) Installation

1. Add this line to your application's Gemfile:

```ruby
gem 'blog_boi', '~> 0'
```

_Note: path may move to github and not be relative_

2. Add these lines to your config/application.rb file:

```ruby
require "active_storage/engine" # If doesn't exist already

ActiveStorage::Engine.config
.active_storage
.content_types_to_serve_as_binary
.delete('image/svg+xml')
```

3. And then execute:

```bash
$ bundle
$ rake active_storage:install `# If hasn't been run yet`
$ rails blog_boi:install:migrations `# not needed for dummy test application`
$ rails db:migrate
```

Your storage.yml file should now have this code:

```
test:
  service: Disk
  root: <%= Rails.root.join("tmp/storage") %>

local:
  service: Disk
  root: <%= Rails.root.join("storage") %>
```

_Note: $ rails railties:install:migrations to copy all new migrations_
_Note: to run migrations only for certain engine, rails db:migrate SCOPE=blog_boi. To revert all migrations from blog_boi engine you can run rails db:migrate SCOPE=blog_boi VERSION=0_

4. And then mount the engine in your app's config/routes.rb file:

```ruby
mount BlogBoi::Engine, at: "/blog"
```

5. Customize scss colour scheme by creating `stylesheets/bootstrap_customizer.scss`. See example in `test/dummy/app/assets/stylesheets`.

6. And then add the engines configuration options in an initializer file (named blog_boi.rb):

```ruby
BlogBoi.author_class = "User" # name of active record model containing authors with property called name (for author's name)
```

See lib/blog_boi.rb for all customization options.

## B) Running tests

- Run all tests other than system: `rake app:test`
- Run system tests: `rake app:test:system`
- Run all tests: `rake` or `rake test`
- In normal rails apps: running single test is possible, but not sure how (or if functionality included out of box for engine). Can also run a particular test method from the test case by providing the -n or --name flag. Can also run an entire directory of tests by providing the path to the directory. I don't think any of this works out of the box for engines. How can I get this to work?

**B.1 Test coverage**

Exists in `coverage` folder in root directory.

To view in a browser, execute from root directory: `open coverage/index.html`

## C) Custom style / SCSS

To override SCSS bootstrap mixins / styles, add a file in parent application called blog_boi/bootstrap_overrides.scss. 
- See test/dummy app for example
- https://getbootstrap.com/docs/4.0/getting-started/theming/ for theming examples (any colours you add, like c1, can be used like btn-c1. Very cool)

Override the header or footer by placing your own files at `views/layouts/_header` or `views/layouts/_footer`

## D) Other useful commands

- `rake db:drop db:create db:migrate db:seed` or `db:migrate:reset db:seed` will remove and recreate and reseed db. Avoid using if possible.
- `rake db:migrate:reset db:seed`

## E) License

The gem is currently available as open source software under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## F) Contributing

This gem is currently not accepting contributions.

## G) Updating gem version (for maintainers)

**G.1 Update version**

In `lib/blog_boi/version.rb` update version.

**G.2 Build gem**

`gem build blog_boi.gemspec`

**G.3 Push gem**

`gem push blog_boi-X.X.X.gem` (replace X's with version)