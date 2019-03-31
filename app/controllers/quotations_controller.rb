# frozen_string_literal: true

class QuotationsController < ApplicationController
  def create
    payload = request.request_parameters
    perform_with(payload)
  end
end
