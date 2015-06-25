source "https://rubygems.org"

ruby "2.2.1"

gem "rails-api"
gem "rails", "4.2.2"
gem "pg"

gem "active_model_serializers"

group :development, :test do
  gem "pry-rails"
  gem "spring"
  gem "rspec-rails", "~> 3.0"
end

group :test do
  gem "rspec-collection_matchers"
  gem "machinist"
  gem "timecop"
end

group :production do
  gem "rails_12factor"
end
