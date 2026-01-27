require "rails_helper"

RSpec.describe "Books", type: :request do
  it "sunny becuase is creates the book and it redirects to it" do
    post books_path, params: { book: { title: "Book 1" } }
    expect(response).to have_http_status(302)
  end

  it "rainy becuase there is no title and the book is not created" do
    post books_path, params: { book: { title: "" } }
    expect(Book.count).to eq(0)
  end
end
