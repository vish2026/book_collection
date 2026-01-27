require "rails_helper"

RSpec.describe Book, type: :model do
  it "sunny because it has a title" do
    b = Book.new(title: "Book 1")
    expect(b).to be_valid
  end

  it "rainy because their is no title" do
    b = Book.new(title: "")
    expect(b).not_to be_valid
  end

  it "has an author field" do
    book = Book.new(title: "Test")
    expect(book).to respond_to(:author)
  end

  it "has a price field" do
    book = Book.new(title: "Test")
    expect(book).to respond_to(:price)
  end

  it "has a published_date field" do
    book = Book.new(title: "Test")
    expect(book).to respond_to(:published_date)
  end

  it "can set author, price, and published_date" do
    expect {
      Book.new(title: "Test", author: "Somebody", price: 9.99, published_date: Date.today)
    }.not_to raise_error
  end
end
