require 'spec_helper'

describe 'Factories' do
  include Helpers

  exclude = []

  Dir.glob('app/models/**/*.rb').each do |filename|
    factory = filename.sub(/^app\/models\//, '').gsub(/\//, '_').sub(/\.rb$/, '')
    if !exclude.include? factory
      exclude << factory
      it "can't create an object with factory :#{factory}" do
        can_create_an_object? factory
      end
    end
  end
end
