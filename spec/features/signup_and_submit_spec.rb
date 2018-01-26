feature 'Signup and submit' do

  scenario 'User to complete email and password and submit' do
    sign_up
    expect(page).to have_content('Welcome b.pourian@hotmail.co.uk')
  end

  scenario 'Expect user count to have increased by one' do
    expect{ sign_up }.to change(User, :count). by(1)
  end

  scenario 'User not created when wrong confirmation password given' do
    expect{ bad_sign_up }.not_to change(User, :count)
  end

  scenario 'Page shows intervention when User gives wrong password confirmation' do
    bad_sign_up
    expect(page).to have_content('Password and confirmation password do not match')
  end

  scenario 'Does not progress to links when wrong password given' do
    bad_sign_up
    expect(page).to have_current_path("/signup")
  end
end
