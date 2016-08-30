require "bundler/gem_tasks"
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
Dir.glob('./spec/gato_spec.rb').each(&method(:import))
