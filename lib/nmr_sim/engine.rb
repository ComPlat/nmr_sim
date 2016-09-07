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

    initializer :append_migrations do |app|
      # keep migration in engine
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end

      # create associations for main app.
      Molecule.class_eval do
        has_one :nmr_simulation, class_name: NmrSimulation,
                foreign_key: "molecule_id",
                dependent: :destroy
      end
    end
  end
end
