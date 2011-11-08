require 'rake'
namespace :db do
	require 'data_mapper'
  desc "Dump data from the current environment's DB."
  task :dump_data do
    boot_repository
    #NOTE: Decimals in your models do not dump!!! I changed mine to Float for this purpose
    DataMapper::Model.descendants.entries.each do |table|
      puts "Dumping #{table}..."
      File.open("#{table}.yml", 'w+') { |f| f.print table.all.to_yaml }
    end
  end


	desc "Load db from yaml file"
  task :load_data do
    boot_repository
    DataMapper::Model.descendants.entries.each do |table|
      puts "Loading #{table}"
			YAML.load_file("#{table}.yml").each do |fixture|
				table.create (fixture)
			end	
		end
	end

  def boot_repository
    DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/mydatabase.db")
    Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |model| require model }
    DataMapper.finalize if DataMapper.respond_to?(:finalize)
	end
end
namespace :test do
  require 'rake/testtask'
  desc "Run rack tests"
  task :test do
	  Dir['test/*rb'].sort.each do |test| 
      load test 
    end
  end
end
task :default => 'test:test'
