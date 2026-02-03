# spec/models/book_spec.rb
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    subject { described_class.new }

    context 'when all required fields are present' do
      let(:valid_book) do
        described_class.new(
          title: 'The Great Gatsby',
          author: 'Mickey Mouse',
          price: 9.99,
          published_at: Date.today
        )
      end

      it 'is valid' do
        expect(valid_book).to be_valid
      end
    end

    # Title
    context 'when title is missing' do
      before do
        subject.title = nil
        subject.author = 'Mickey Mouse'
        subject.price = 9.99
        subject.published_at = Date.today
      end

      it 'is invalid' do
        expect(subject).not_to be_valid
      end

      it 'has a presence error on title' do
        subject.valid?
        expect(subject.errors[:title]).to include("can't be blank")
      end
    end

    # Author
    context 'when author is missing' do
      before do
        subject.title = 'The Great Gatsby'
        subject.author = nil
        subject.price = 9.99
        subject.published_at = Date.today
      end

      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end

    # Price
    context 'when price is missing' do
      before do
        subject.title = 'The Great Gatsby'
        subject.author = 'Mickey Mouse'
        subject.price = nil
        subject.published_at = Date.today
      end

      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end

    # Published date
    context 'when published_at is missing' do
      before do
        subject.title = 'The Great Gatsby'
        subject.author = 'Mickey Mouse'
        subject.price = 9.99
        subject.published_at = nil
      end

      it 'is invalid' do
        expect(subject).not_to be_valid
      end
    end
  end
end