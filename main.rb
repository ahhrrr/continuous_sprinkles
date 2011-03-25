require 'config'
require 'packages/apache'
require 'packages/hudson'
require 'packages/ruby'

deployment do
  delivery :capistrano do
    recipes 'deploy'
  end

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end

policy :ci, :roles => :master do
  requires :hudson
  requires :ruby
  requires :rubygems
end

