require 'rake'
require 'rake/testtask'

task :default do
	Dir['test/*rb'].sort.each do |test| 
    load test 
  end
end
