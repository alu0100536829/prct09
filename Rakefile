$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require "bundler/gem_tasks"

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Expectativas de la clase Matriz" 
task :test do
        sh "rspec -I. spec/matriz_spec.rb --format documentation"
end

desc "Expectativas de la clase Matriz, con documentacion HTML"
task :thtml do
        sh "rspec -I. spec/matriz_spec.rb --format html"
end

desc "Pruebas unitarias de las clases MatrizDensa y MatrizDispersa" 
task :tc do
        sh "ruby -I. test/tc_matriz.rb --format documentation"
end
