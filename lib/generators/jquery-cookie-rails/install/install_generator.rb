require 'rails'

# Supply generator for Rails 3.0.x or if asset pipeline is not enabled
if ::Rails.version < "3.1" || !::Rails.application.config.assets.enabled
  module JqueryCookie
    module Generators
      class InstallGenerator < ::Rails::Generators::Base

        desc "This generator installs jquery-cookie #{JqueryCookie::Rails::JS_VERSION}"
        source_root File.expand_path('../../../../../vendor/assets', __FILE__)

        def copy_files
          say_status("copying", "jquery-cookie (#{JqueryCookie::Rails::JS_VERSION})", :green)
          copy_file "javascripts/jquery.cookie.js", "public/javascripts/jquery.cookie.js"
        end

      end
    end
  end
else
  module JqueryCookie
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        desc "Just show instructions so people will know what to do when mistakenly using generator for Rails 3.1 apps"

        def do_nothing
          say_status("deprecated", "You are using Rails 3.1 or the asset pipeline enabled, so this generator is not needed.")
          say_status("", "The necessary files are already in your asset pipeline.")
          say_status("", "Just add `//= require jquery.cookie` to your app/assets/javascripts/application.js")
          say_status("", "If you do not want the asset pipeline enabled, you may turn it off in application.rb and re-run this generator.")
          # ok, nothing
        end
      end
    end
  end
end
