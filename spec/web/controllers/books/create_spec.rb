require 'spec_helper'
require_relative '../../../../apps/web/controllers/books/create'

describe Web::Controllers::Books::Create do
  let(:action) { Web::Controllers::Books::Create.new }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

    it 'is creates a book' do
      action.call(params)
      book = repository.last

      expect(book.id).to_not be_nil
      expect(book.title).to eql params.dig(:book, :title)
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eql 302
      expect(response[1]['Location']).to eql '/books'
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eql 422
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to include 'is missing'
      expect(errors.dig(:book, :author)).to include 'is missing'
    end
  end
end