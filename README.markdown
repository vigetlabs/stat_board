StatBoard
=========

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

## Contributing

Happily accepting contributions to improve StatBoard. To contribute, fork, add your thing, add some specs, and send a pleasantly worded pull request.

* * *

StatBoard is released under the [MIT License][mit]. See MIT-LICENSE for further details.

[mit]: http://www.opensource.org/licenses/MIT
