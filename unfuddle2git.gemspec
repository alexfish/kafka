Gem::Specification.new do |s|
  s.name        = 'unfuddle2git'
  s.version     = '0.0.1'
  s.date        = '2012-10-03'
  s.summary     = "Convert unfuddle svn 2 git"
  s.description = "Converts svn repos to git"
  s.authors     = ["Alex Fish"]
  s.email       = 'alex@alexefish.com'
  s.files       = ["lib/unfuddle2git.rb", "lib/feedback.rb", "bin/unfuddle2git"]
  s.executables << "unfuddle2git"
end