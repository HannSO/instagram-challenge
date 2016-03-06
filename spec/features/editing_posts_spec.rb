require 'rails_helper'

feature 'editing posts' do
  background do
    post = create(:post, caption: "This will be changed")
    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link('Edit post')
  end

  scenario 'can edit post' do
    fill_in 'Caption', with: "Something else"
    click_button "Update Post"
    expect(page).to have_content("Post updated")
    expect(page).to have_content("Something else")
    expect(page).not_to have_content("This will be changed")
  end
end
