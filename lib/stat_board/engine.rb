module StatBoard
  class Engine < ::Rails::Engine
    isolate_namespace StatBoard

    if Rails.version >= '3.1'
      initializer 'stat_board.assets.precompile' do |app|
        app.config.assets.precompile += %w(stat_board/highcharts.js)
      end
    end
  end
end
