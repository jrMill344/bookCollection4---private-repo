require 'rails_helper'

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

    click_button "Create Book"

    expect(page).to have_text("Title can't be blank")
  end
end
