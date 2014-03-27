Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'pagez'
  s.version     = "0.1.0"
  s.summary     = 'Easy pagination for everything.'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = '>= 1.8.11'

  s.license = 'MIT'

  s.author   = 'Michael Lutsiuk'
  s.email    = 'mmaccoffe@gmail.com'
  s.homepage = 'http://github.com/mediaslave24/pagez'

  s.files = Dir["README.md", "lib/**/*.rb"]

  s.add_development_dependency 'rspec'
end

