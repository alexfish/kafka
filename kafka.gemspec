Gem::Specification.new do |s|
  s.name        = 'kafka'
  s.version     = '0.0.1'
  s.date        = '2012-10-03'
  s.summary     = "Convert svn 2 git"
  s.description = "Converts svn repos to git"
  s.authors     = ["Alex Fish"]
  s.email       = 'alex@alexefish.com'
  s.files       = ["lib/kafka.rb", "lib/feedback.rb", "bin/kafka"]
  s.executables << "kafka"
end