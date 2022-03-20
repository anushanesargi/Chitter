feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    fill_in('username', with: 'test123')
    fill_in('password', with: 'password12')
    click_button('Register')

    expect(page).to have_content "Welcome, test123"
  end
end