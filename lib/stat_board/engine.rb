module StatBoard
  class Engine < ::Rails::Engine
    isolate_namespace StatBoard

    if Rails.version > "3.1"
      initializer "StatBoard precompile hook" do |app|
        app.config.assets.precompile += %w(stat_board/bootstrap.css)
      end
    end
  end
end
