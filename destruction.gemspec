require "./lib/destruction/version"

Gem::Specification.new do |s|
  s.name = "destruction"
  s.version = Destruction::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Yi Wei"]
  s.email = ["yiwei.in.cyber@gmail.com"]
  s.summary = "A Ruby values destruction framework inspired by Clojure"
  s.description = s.summary
  s.files = Dir.glob("lib/**/*") + %w(README.md LICENSE Rakefile)
  s.require_path = "lib"
end

