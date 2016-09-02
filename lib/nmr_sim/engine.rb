module NmrSim
  class Engine < ::Rails::Engine
    isolate_namespace NmrSim

    config.autoload_paths << File.expand_path("../..", __FILE__)

  #  config.to_prepare do
  #    Dir.glob(Engine.root + "app/serializers/**/*_serializer*.rb").each do |c|
  #      require_dependency(c)
  #    end
  #    require_dependency(File.join(Engine.root , "app/api/api.rb"))
  #  end

  #  config.generators do |g|
  #    g.test_framework :rspec
  #    g.fixture_replacement :factory_girl, :dir => 'spec/factories'
  #  end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
