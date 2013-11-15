StatBoard
=========

[![Code Climate](https://codeclimate.com/github/vigetlabs/stat_board.png)](https://codeclimate.com/github/vigetlabs/stat_board)

A simple dashboard of records created this week, this month, and all time, mountable as a Rails Engine.

<img src="https://raw.github.com/vigetlabs/stat_board/master/screenshot.png" />

## Basic Configuration

1. Add gem to `Gemfile`:

        gem 'stat_board'

2. Mount engine (in `config/routes.rb`):

        YourApp::Application.routes.draw do
          mount StatBoard::Engine, :at => "/stats"

3. Configure models (in `config/initializers/stat_board.rb`):

        StatBoard.models = [User, Post, Comment]

Models can also be listed as strings if you encounter any loading order issues.

## Additonal Configuration

In `config/initializers/stat_board.rb`:

1. Title

        StatBoard.title = "YourApp Stats"

2. Basic Authentication

        StatBoard.username = "user"
        StatBoard.password = "pass"

3. Displaying Data Graphically (true by default)

        StatBoard.display_graph = true

## Issues

  * Models can be specified as strings rather than constants
    if you encounter loading order issues.
  * If you're using the Asset Pipeline, you'll need to add
    `stat_board/bootstrap.css` to your precompile paths.
  * If you have `config.assets.initialize_on_precompile` set to `false`, then
    you will need to add `stat_board/highcharts.js` to your precompile paths.

## Contributing

Happily accepting contributions to improve StatBoard. To contribute, fork, add your thing, add some specs, and send a pleasantly worded pull request.

In order to setup the databases locally, you'll need to: `bundle exec rake db:migrate app:db:test:prepare`

* * *

StatBoard is released under the [MIT License][mit]. See MIT-LICENSE for further details.

[mit]: http://www.opensource.org/licenses/MIT
