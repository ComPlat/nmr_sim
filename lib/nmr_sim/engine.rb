module NmrSim
  class Engine < ::Rails::Engine
    isolate_namespace NmrSim

    config.autoload_paths << File.expand_path("../..", __FILE__)
  end
end
