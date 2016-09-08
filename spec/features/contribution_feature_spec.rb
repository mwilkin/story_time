require 'rails_helper'

describe 'the contribution feature' do
  it 'should allow user to add a new contribution' do
    story = Story.create(title: 'Then I Found Five Dollars')
    visit story_path(story)
    click_on 'Add New Contribution'
    fill_in 'Creator', with: 'Miyamoto Musashi'
    fill_in 'Content', with: 'While reflecting upon the Way, I realized that the true Art of War, is peace.'
    click_on 'Create Contribution'
    expect(page).to have_content('While reflecting upon the Way, I realized that the true Art of War, is peace.')
  end
end
