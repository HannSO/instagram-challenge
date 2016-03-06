require 'rails_helper'

feature 'Index displays posts' do
  scenario 'index displays correct post information' do
    post_one = create(:post, caption: "This is post one")
    post_two = create(:post, caption: "This is post two")

    visit '/'
    expect(page).to have_content("This is post one")
    expect(page).to have_content("This is post two")
    expect(page).to have_css("img[src*='beach']")
  end
end
