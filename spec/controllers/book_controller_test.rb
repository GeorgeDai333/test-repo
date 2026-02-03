# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:book) { create(:book) }

  describe 'GET /index' do
    it 'returns success' do
      get books_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /new' do
    it 'returns success' do
      get new_book_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns success' do
      get book_path(book)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns success' do
      get edit_book_path(book)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'updates the book and redirects' do
      patch book_path(book), params: {
        book: {
          title: 'Updated Title',
          author: 'Updated Author',
          price: 0,
          published_at: Date.today
        }
      }

      expect(response).to redirect_to(book_path(book))
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the book and redirects' do
      expect {
        delete book_path(book)
      }.to change(Book, :count).by(-1)

      expect(response).to redirect_to(books_path)
    end
  end

  describe 'POST /create' do
    context 'with valid attributes' do
      it 'creates a book and shows success flash' do
        expect {
          post books_path, params: {
            book: {
              title: 'The Not So Great Gatsby',
              author: 'Minnie Mouse',
              price: 14.99,
              published_at: Date.new(1965, 8, 1)
            }
          }
        }.to change(Book, :count).by(1)

        expect(response).to redirect_to(book_path(Book.last))

        follow_redirect!
        expect(response.body).to include('Book was successfully created')
      end
    end

    context 'with missing author' do
      it 'does not create a book and returns unprocessable entity' do
        expect {
          post books_path, params: {
            book: {
              title: 'The Not So Great Gatsby',
              author: nil,
              price: 14.99,
              published_at: Date.new(1965, 8, 1)
            }
          }
        }.not_to change(Book, :count)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
