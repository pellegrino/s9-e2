# More info at https://github.com/guard/guard#readme

guard 'bundler' do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
end

guard 'spork', :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('Gemfile')
  watch(/^.+\.gemspec/)
  watch('spec/spec_helper.rb')
end

guard 'rspec', :version => 2 do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^lib/log/(.+)\.rb$})     { |m| "spec/lib/log_#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

