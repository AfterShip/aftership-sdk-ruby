require 'bundler/gem_tasks'
require 'rubocop/rake_task'
RuboCop::RakeTask.new

task default: [:spec]
desc 'run Rspec specs'
task :spec do
  sh 'rspec spec'
end
