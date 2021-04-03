class ApplicationController < ActionController::Base
    skip_before_action :require_login, only: [:home]

    def home
        render json: {message: "Server is up and running!"}
    end
end
