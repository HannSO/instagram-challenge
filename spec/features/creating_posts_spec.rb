require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post with photo' do

    visit '/'
    click_link 'New Post'
    expect(current_path).to eq "/posts/new"
    fill_in 'Caption', with: 'sun!'
    attach_file('Image', 'spec/files/images/beach.jpg')
    click_button 'Create Post'
    expect(page).to have_content('sun!')
    expect(page).to have_css("img[src*='beach.jpg']")
  end

  scenario 'user does not submit a photo' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'sun!'
    click_button 'Create Post'
    expect(page).to have_content('You have forgotten to upload an image!')
  end
end
