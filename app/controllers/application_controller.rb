require_relative '../../lib/tasks/json_web_token.rb'

class ApplicationController < ActionController::Base #:API
    skip_before_action :verify_authenticity_token
    # include ActionController::Cookies

    def not_found
        render json: { error: 'not_found' }
    end

    def authorize_request
        jwt_cookie = cookies.signed[:jwt_token]

        if jwt_cookie
        begin
            @decoded = JsonWebToken.decode(jwt_cookie)
            @current_user = User.find(@decoded[:user_id])
        rescue ActiveRecord::RecordNotFound => e
            render json: { errors: e.message }, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
        end
        else
        render json: { errors: 'Unauthorized: JWT token not found in the cookie' }, status: :unauthorized
        end
    end
end
