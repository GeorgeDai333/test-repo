# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, :price, :published_at, presence: true
end
