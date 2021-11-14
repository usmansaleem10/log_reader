# frozen_string_literal: true

require_relative "lib/log_reader"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

require "rubocop/rake_task"

RuboCop::RakeTask.new

task default: %i[spec rubocop]
desc "execute the parser"
task :run do
  LogReader::PageStats.new(ENV["FILE"]).call
end
