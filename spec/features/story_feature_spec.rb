require 'rails_helper'

describe 'the story feature' do

  it 'should allow user to add a new story' do
    visit stories_path
    click_on 'Add New Story'
    fill_in 'Title', with: 'August\'s Biking Adventures'
    fill_in 'Creator', with: 'Beetle the Bard'
    click_on 'Create Story'
    expect(page).to have_content('August\'s Biking Adventures')
  end

  it 'gives error when no title is entered' do
    visit new_story_path
    click_on 'Create Story'
    expect(page).to have_content 'Please correct the errors'
  end

  it 'should all user to update a story title' do
    story = Story.create(title: 'Then I Found Five Dollars')
    visit story_path(story)
    click_on 'Edit'
    fill_in 'Title', with: "Then I Found Ten Dollars"
    click_on 'Update Story'
    expect(page).to have_content 'Then I Found Ten Dollars'
  end

end
