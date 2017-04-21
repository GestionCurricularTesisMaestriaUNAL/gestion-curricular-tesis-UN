require 'rails_helper.rb'

feature 'Creating user' do
  scenario 'can create a user' do

    visit '/users'
    # 2. click on Add New User button
    click_link 'Nuevo Usuario'
    # 3. Fill form
    fill_in 'user[firstname]', with: 'Ulisses'
    fill_in 'user[lastname]', with: 'Perez'
    fill_in 'user[email]', with: 'aaaa'
    fill_in 'user[identification]', with: '12345'
    fill_in 'user[phone]', with: '12345'
    #fill_in 'rol[]', with: '1'
    # 4. Click on submit form button
    click_button 'Crear'
    # 5. Then we should be redirected to show page with user details (user firstname)
    expect(page).to have_content('Ulisses')
  end
end