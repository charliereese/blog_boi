By [Charlie Reese](https://charliereese.ca/about) at [Clientelify](https://clientelify.com)

# BlogBoi

BlogBoi is a rails gem / engine that provides out-of-the-box blogging functionality to your rails application. 

It requires active_storage for photo upload / storage.

## Installation

1. Add this line to your application's Gemfile:

```ruby
gem 'blog_boi', '~> 0'
```

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

7. Finally, your parent application must define the method `admin_signed_in?`. If you are using Devise, this method may already exist. It should return true if the blog admin is signed in, and false if not. When it returns true, you may create, update, and destroy blog articles. It should be available in controllers and views; it should be defined in ApplicationController, and should be marked a helper method. E.g.

```
class ApplicationController < ActionController::Base

  helper_method :admin_signed_in?

  def admin_signed_in?
    ...
  end

end
```

## View partial hooks

List of view partial hooks that are rendered if they exist in parent application:

- `layouts/blog_boi/head_extension`: (for adding html to head of blog_boi application layout in `layouts/blog_boi/application`)

## Custom style / SCSS

To override SCSS bootstrap mixins / styles, add a file in parent application called blog_boi/bootstrap_overrides.scss. 
- See test/dummy app for example
- https://getbootstrap.com/docs/4.0/getting-started/theming/ for theming examples (any colours you add, like c1, can be used like btn-c1. Very cool)

Override the header or footer by placing your own files at `views/layouts/_header` or `views/layouts/_footer`

## Running tests

- Run all tests other than system: `rake app:test`
- Run system tests: `rake app:test:system`
- Run all tests: `rake` or `rake test`

**Test coverage**

Exists in `coverage` folder in root directory.

To view in a browser, execute from root directory: `open coverage/index.html`

## License

The gem is currently available as open source software under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Contributing

This gem is currently not actively accepting contributions. 

With that in mind, if you'd like to make a fix / change, please create a pull request (and when I have a moment - probably in a couple weeks time - I'll have a look)!

## Updating gem version (for maintainers)

**1. Update version**

In `lib/blog_boi/version.rb` update version.

**2. Build gem**

`gem build blog_boi.gemspec`

**3. Push gem**

`gem push blog_boi-X.X.X.gem` (replace X's with version)

**4. Tag GitHub**

`git add -A`
`git commit -m "Msg"`
`git push`
`git tag -a vX.X.X -m "Msg"`
`git push --tags`