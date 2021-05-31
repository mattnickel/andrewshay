module API
  class Base < Grape::API
    mount API::V1::Base
    mount API::V1::Users
    mount API::V1::Tasks
  end
end