# frozen_string_literal: true

module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        def create
          super.tap do
            old_values = session.to_hash
            reset_session
            session.update old_values.except('_undp_key')
          end
        end

        def respond_with(resource, _opts = {})
          if resource.errors?
            invalid_resource(resource)
          else
            render json: UserSerializer.new(resource, include: %i[roles profile profile_photo cover_photo],
                                                      params: { current_user: resource })
          end
        end

        def respond_to_on_destroy
          head :ok
        end
      end
    end
  end
end
