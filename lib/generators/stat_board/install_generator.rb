module StatBoard
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "creates an initializer file at config/initializers/stat_board.rb and adds StatBoard route to config/routes.rb"
      source_root File.expand_path("../templates", __FILE__)

      def generate_initialization
        copy_file 'initializer.rb', 'config/initializers/stat_board.rb'
      end

      def generate_routing
        route "mount StatBoard::Engine, at: 'stats'"
        log "# You can access StatBoard url like this: stat_board.root_url #=> '/stats'"
      end
    end
  end
end
