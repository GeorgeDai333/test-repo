# frozen_string_literal: true

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'book is valid with all fields' do
    book = Book.new(title: 'The Great Gatsby', author: 'Mickey Mouse', price: 9.99, published_at: Date.today)
    assert book.valid?
  end

  test 'book is invalid without a title' do
    book = Book.new(title: nil, author: 'Mickey Mouse', price: 9.99, published_at: Date.today)
    assert_not book.valid?
    assert_includes book.errors[:title], "can't be blank"
  end

  # Author
  test 'book is invalid without an author' do
    book = Book.new(title: 'The Great Gatsby', author: nil, price: 9.99, published_at: Date.today)
    assert_not book.valid?
  end

  # Price
  test 'book is invalid without a price' do
    book = Book.new(title: 'The Great Gatsby', author: 'Mickey Mouse', price: nil, published_at: Date.today)
    assert_not book.valid?
  end

  # Published Date
  test 'book is invalid without a published date' do
    book = Book.new(title: 'The Great Gatsby', author: 'Mickey Mouse', price: 9.99, published_at: nil)
    assert_not book.valid?
  end
end
