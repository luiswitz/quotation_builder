# frozen_string_literal: true

class User < ApplicationRecord
  has_many :quotations

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  validates :phone_number, presence: true
end
