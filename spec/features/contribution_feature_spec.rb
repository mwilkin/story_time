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

  it 'should allow user to edit a contribution' do
    story = Story.create(title: 'Then I Found Five Dollars')
    contribution = story.contributions.create(content: 'on the seat of my bicycle', image: 'image1.jpeg', creator: 'Matt')
    visit story_contribution_path(story, contribution)
    click_on 'Edit'
    fill_in 'Creator', with: 'Fred Flintsone'
    fill_in 'Content', with: 'on the seat of car.'
    click_on 'Update Contribution'
    expect(page).to have_content('on the seat of car.')
  end

  it 'should allow user to delete a contribution' do
    story = Story.create(title: 'Then I Found Five Dollars')
    contribution = story.contributions.create(content: 'on the seat of my bicycle', image: 'image1.jpeg', creator: 'Matt')
    visit story_contribution_path(story, contribution)
    click_on 'Delete'
    expect(page).to_not have_content('on the seat of bicycle.')
  end

end
