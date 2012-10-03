Gem::Specification.new do |s|
  s.name        = 'kafka'
  s.version     = '0.0.2'
  s.date        = '2012-10-04'
  s.summary     = "Metamorph svn repositories to git"
  s.description = "Uses the power of metamorphosis to migrate svn repositories to git"
  s.authors     = ["Alex Fish"]
  s.homepage    = "https://github.com/alexefish/kafka"
  s.email       = 'alex@alexefish.com'
  s.files       = ["lib/kafka.rb", "lib/feedback.rb", "bin/kafka"]
  s.executables << "kafka"
end