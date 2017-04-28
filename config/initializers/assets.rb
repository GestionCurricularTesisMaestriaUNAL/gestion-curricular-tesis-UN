# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( layout/bootstrap-theme.min.css )
Rails.application.config.assets.precompile += %w( layout/base.css )
Rails.application.config.assets.precompile += %w( layout/phone.css )
Rails.application.config.assets.precompile += %w( layout/printer.css )
Rails.application.config.assets.precompile += %w( layout/reset.css )
Rails.application.config.assets.precompile += %w( layout/small.css )
Rails.application.config.assets.precompile += %w( layout/tablet.css )
Rails.application.config.assets.precompile += %w( layout/unal.css )

Rails.application.config.assets.precompile += %w( layout/html5shiv.js )
Rails.application.config.assets.precompile += %w( layout/matchmedia.addListener.js )
Rails.application.config.assets.precompile += %w( layout/matchmedia.polyfill.js )
Rails.application.config.assets.precompile += %w( layout/respond.js )
Rails.application.config.assets.precompile += %w( layout/unal.js )
Rails.application.config.assets.precompile += %w( layout/students.js )
Rails.application.config.assets.precompile += %w( layout/directors.js )
Rails.application.config.assets.precompile += %w( layout/jurys.js )
Rails.application.config.assets.precompile += %w(dropzone.js basic.css dropzone.css)


