describe Book do
  it 'can be initialized with attributes' do
    book = Book.new(title: 'Refactoring')
    expect(book.title).to eql 'Refactoring'
  end
end
