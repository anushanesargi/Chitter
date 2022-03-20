feature 'authentication' do
  it 'a user can sign in' do

    User.create(username: 'test12', password: 'password12')

    visit '/'
    fill_in(:username, with: 'test12')
    fill_in(:password, with: 'password12')
    click_button('Login')

    expect(page).to have_content 'Welcome, test12'
  end
end