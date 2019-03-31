# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    payload = {}
    perform_with(payload)
  end
end
