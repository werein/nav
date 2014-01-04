require 'core'
require 'auth'
require 'decorators'

module Nav
  class Engine < ::Rails::Engine
    isolate_namespace Nav

    config.to_prepare do
      Decorators.register! Engine.root, Rails.root
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths["db/migrate"].expanded.each do |expanded_path|
          app.config.paths["db/migrate"] << expanded_path
        end
      end
    end
  end
end
