require 'fancy_logger'
require 'pathname'

begin
  require 'bundler/setup'
  require 'bundler/gem_tasks'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

$logger       = FancyLogger.new(STDOUT)
$project_path = Pathname.new(__FILE__).dirname.expand_path
$spec         = eval( $project_path.join('jquery-cookie-rails.gemspec').read )

Rake::TaskManager.record_task_metadata = true

def run_command(command)
  result = `#{command}`.chomp.strip

  message = if result.empty?
    command
  else
    command + "\n" + result.lines.collect { |line| "  #{line}" }.join
  end

  $logger.debug(message)

  result
end

namespace :jquery_cookie do
  desc 'Update the `jquery-cookie` submodule'
  task :update do
    jquery_cookie_path = $project_path.join('lib', 'jquery-cookie')
    latest_tag         = run_command("cd #{jquery_cookie_path} && git describe --abbrev=0 --tags")

    run_command "cd #{jquery_cookie_path} && git checkout #{latest_tag}"
  end

  desc 'Copy the `jquery.cookie.js` file to the `vendor/assets/javascripts` folder'
  task :vendor do
    jquery_cookie_path = $project_path.join('lib', 'jquery-cookie', 'jquery.cookie.js')
    vendor_path        = $project_path.join('vendor', 'assets', 'javascripts')
    vendor_path.mkpath

    run_command "cp #{jquery_cookie_path} #{vendor_path}"
  end
end

desc 'Update jquery-cookie and copy `jquery.cookie.js` into vendor'
task :jquery_cookie => ['jquery_cookie:update', 'jquery_cookie:vendor']

desc 'Update jquery-cookie, update jquery-cookie-rails version, tag on git'
task :update => :jquery_cookie do
  jquery_cookie_path = $project_path.join('lib', 'jquery-cookie')
  latest_tag         = run_command("cd #{jquery_cookie_path} && git describe --abbrev=0 --tags")
  version            = latest_tag.gsub(/^v/, '')
  version_path       = $project_path.join('VERSION')

  run_command "git add ."
  run_command "git commit -m \"Version bump to #{version}\""
  run_command "git tag #{version}"
end

task :default do
  Rake::application.options.show_tasks = :tasks  # this solves sidewaysmilk problem
  Rake::application.options.show_task_pattern = //
  Rake::application.display_tasks_and_comments
end
