# For some reason, the rspec tasks started failing, so here are some
# quick and dirty ones.

namespace "spec" do
  task :models => "db:test:prepare" do
    sh "rspec spec/models"
  end
  task :controllers => "db:test:prepare" do
    sh "rspec spec/controllers"
  end
end

task :spec => "db:test:prepare" do
  sh "rspec spec/models spec/controllers"
end

Rake::Task[:default].clear
task :default => :spec
