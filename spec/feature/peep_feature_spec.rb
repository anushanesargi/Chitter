feature 'peeps' do
  scenario 'peep of a user is seen with username' do

    User.create(username: 'test12', password: 'password12')

    p "user created"

    visit '/'

    p "visited /"

    fill_in('input_username', with: 'test12')

    p "filled in username"

    fill_in('input_password', with: 'password12')

    p "filled in password"

    click_button('Login')

    p "clicked login"

    fill_in('message', with: 'Hello!')

    p "filled in hello"

    click_button('Post')

    p "clicked post"
    
    expect(page).to have_content 'Hello!'
    expect(page).to have_link 'test12'

  end

end