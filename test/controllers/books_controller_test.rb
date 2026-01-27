require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { 
        title: "Updated Title" , 
        author: "Updated Author",
        price: 0,
        published_at: Date.today} }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end

  test "should create book with all attributes and show success flash" do
    assert_difference("Book.count") do
      post books_url, params: { book: {
        title: "The Not So Great Gatsby",
        author: "Minnie Mouse",
        price: 14.99,
        published_at: Date.new(1965,8,1)
      }}
    end

    assert_redirected_to book_url(Book.last)
    follow_redirect!
    assert_match "Book was successfully created", response.body
  end

  test "should not create book without author and show error flash" do
    assert_no_difference("Book.count") do
      post books_url, params: { book: {
        title: "The Not So Great Gatsby",
        author: nil,
        price: 14.99,
        published_at: Date.new(1965,8,1)
      }}
    end

    assert_response :unprocessable_entity
  end


end
