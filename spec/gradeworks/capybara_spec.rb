require 'rails_helper.rb'

url = ''

feature 'Creating, showing, editing and deleting a gradework' do
  scenario 'can create a gradework' do

    visit '/gradeworks'
    # 2. click on Add New User button
    click_link 'Nueva Tesis'
    # 3. Fill form
    fill_in 'gradework[name]', with: 'Ulisses'
    fill_in 'gradework[description]', with: 'Description'
    fill_in 'gradework[semester]', with: '10'
    # 4. Click on submit form button
    click_button 'Crear'
    # 5. Then we should be redirected to show page with user details (user firstname)
    url = URI.parse(current_url).path
    #p url[2]
    expect(page).to have_content('Ulisses')


    #visit url
    # 2. click on Edit User button
    click_link 'Editar'
    # 3. Fill form
    fill_in 'gradework[name]', with: 'Ulisses editado'
    fill_in 'gradework[description]', with: 'Description editada'
    fill_in 'gradework[semester]', with: '10'
    # 4. Click on submit form button
    click_button 'Editar'
    # 5. Then we should be redirected to show page with user details (user firstname)
    expect(page).to have_content('Ulisses editado')



    #click_link 'Borrar'
    #expect(page).to have_content('Ulisses editado')

  end
end