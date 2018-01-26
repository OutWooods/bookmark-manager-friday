feature 'Signup and submit' do

  scenario 'User to complete email and password and submit' do
    sign_up
    expect(page).to have_content('Welcome b.pourian@hotmail.co.uk')
  end

  scenario 'Expect user count to have increased by one' do
    expect{ sign_up }.to change(User, :count). by(1)
  end

  scenario 'User gives wrong confirmation password' do
    expect{ bad_sign_up }.not_to change(User, :count)
  end

  scenario 'User gives wrong confirmation password' do
    bad_sign_up
    expect(page).not_to have_content("a.pourian@hotmail.co.uk")
  end

  def sign_up
    visit '/signup'
    fill_in('email', :with => 'b.pourian@hotmail.co.uk')
    fill_in('password', :with => 'password1')
    click_button 'submit'
  end

  def bad_sign_up
    visit '/signup'
    fill_in('email', :with => 'a.pourian@hotmail.co.uk')
    fill_in('password', :with => 'password1')
    fill_in('password confirmation', :with => 'password2')
    click_button 'submit'
  end
end
