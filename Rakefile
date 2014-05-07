require "bundler"
Bundler.setup

require "rake"
require "rspec/core/rake_task"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "destruction/version"

task :gem => :build
task :build do
  system "gem build destruction.gemspec"
end

task :install => :build do
  system "sudo gem install destruction-#{destruction::VERSION}.gem"
end

task :release => :build do
  system "git tag -a v#{destruction::VERSION} -m 'Tagging #{destruction::VERSION}'"
  system "git push --tags"
  system "gem push destruction-#{destruction::VERSION}.gem"
  system "rm destruction-#{destruction::VERSION}.gem"
end

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task :default => :spec
