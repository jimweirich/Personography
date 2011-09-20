namespace "heroku" do
  task :prod do
    ENV["RAILS_ENV"] = "production"
  end

  desc "Precompile the Assets for Heroku"
  task :assets => [:prod, "assets:precompile"]

  desc "Do any prep work for a Heroku deploy"
  task :prep => :assets
end
