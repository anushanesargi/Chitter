feature 'peeps' do
  scenario 'peep of a user is seen with username' do

    User.create(username: 'test12', password: 'password12')

    visit '/'
    fill_in('input_username', with: 'test12')
    fill_in('input_password', with: 'password12')
    click_button('Login')
    fill_in('message', with: 'Hello!')
    click_button('Post')

    expect(page).to have_content 'Hello!'
    expect(page).to have_link 'test12'

  end

end