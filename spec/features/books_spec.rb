require 'rails_helper'

<<<<<<< HEAD
RSpec.feature "Books", type: :feature do
  scenario "User adds a book successfully" do
    visit new_book_path

    fill_in "Title", with: "New Book"
    # The following lines will fail initially
    fill_in "Author", with: "Jane Doe"
    fill_in "Price", with: 12.99
    select Date.today.year, from: "book_published_date_1i" if page.has_select?("book_published_date_1i")

    click_button "Create Book"

    # Check for flash notice
    expect(page).to have_text("Book was successfully created")
    expect(Book.last.title).to eq("New Book")
  end

  scenario "User fails to add a book without title" do
    visit new_book_path

    fill_in "Title", with: ""
=======
RSpec.feature "Books management", type: :feature do
  scenario "User creates a book successfully" do
    visit new_book_path

    fill_in "Title", with: "RSpec Book"
    fill_in "Author", with: "Jane Doe"
    fill_in "Price", with: "12.50"
    select Date.today.year, from: "book_published_date_1i"
    select Date.today.strftime("%B"), from: "book_published_date_2i"
    select Date.today.day, from: "book_published_date_3i"

    click_button "Create Book"

    expect(page).to have_text("Book was successfully created.")
    expect(Book.last.title).to eq("RSpec Book")
  end

  scenario "User fails to create a book without title" do
    visit new_book_path

>>>>>>> dev
    click_button "Create Book"

    expect(page).to have_text("Title can't be blank")
  end
end
