RSpec.configure do |config|
  config.around(:each, frozen: true) do |scenario|
    Timecop.freeze { scenario.run }
  end

  config.after(:each) do
    Timecop.return
  end
end
