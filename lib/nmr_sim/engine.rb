module NmrSim
  class Engine < ::Rails::Engine
    isolate_namespace NmrSim

    config.autoload_paths << File.join(Engine.root , "lib")

    # add grape routes
    config.to_prepare do
      require_dependency(File.join(Engine.root , "app/api/api.rb"))

      Dir.glob(Engine.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    # keep migration in engine
    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end

  end
end
