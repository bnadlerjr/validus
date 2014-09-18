#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"
require "rdoc/task"
require "flay_task"
require "flog_task"

DEFAULT_TASKS    = %w[test flog flay]
MAIN_RDOC        = 'README.md'
EXTRA_RDOC_FILES = [MAIN_RDOC]
LIB_FILES        = Dir["lib/**/*.rb"]
TEST_FILES       = Dir["test/**/*_test.rb"]
TITLE            = 'Validus'

# Import external rake tasks
Dir.glob('tasks/*.rake').each { |r| import r }

desc "Default tasks: #{DEFAULT_TASKS.join(', ')}"
task :default => DEFAULT_TASKS

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = TEST_FILES
end

RDoc::Task.new do |t|
  t.main = MAIN_RDOC
  t.rdoc_dir = 'doc'
  t.rdoc_files.include(EXTRA_RDOC_FILES, LIB_FILES)
  t.options << '-q'
  t.title = TITLE
end

FlayTask.new do |t|
  t.dirs = %w[lib]
end

FlogTask.new do |t|
  t.dirs = %w[lib]
end
