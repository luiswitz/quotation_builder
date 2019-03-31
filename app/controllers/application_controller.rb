# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def perform_with(payload)
    controller = params[:controller].capitalize
    action = params[:action].capitalize
    class_name = "Endpoints::#{controller}::#{action}Endpoint"
    klass = class_name.constantize
    response = klass.new.perform(payload)

    render json: response.to_h, status: response.status
  end
end
