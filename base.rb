plugin 'haml', :git => "git://github.com/nex3/haml.git"
plugin 'factory_girl', :git => "git://github.com/thoughtbot/factory_girl.git"

if yes?("Do you want to have attachments")
  plugin 'paperclip', :git => "git://github.com/thoughtbot/paperclip.git"
end

if yes?("Do you want to use RSpec for testing?")
  plugin "rspec", :git => "git://github.com/dchelimsky/rspec.git"
  plugin "rspec-rails", :git => "git://github.com/dchelimsky/rspec-rails.git"
  generate :rspec
end

generate :nifty_layout

git :init

run "echo 'TODO add readme content' > README"
run "touch tmp/.gitignore log/.gitignore vendor/.gitignore"
run "cp config/database.yml config/example_database.yml"

file ".gitignore", <<-END
log/*.log
tmp/**/*
config/database.yml
db/*.sqlite3
END

git :add => ".", :commit => "-m 'initial commit'"
