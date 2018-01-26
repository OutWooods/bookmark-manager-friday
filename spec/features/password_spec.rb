feature 'password encryption' do

  scenario 'user setup an account' do
    sign_up
    user = User.first(email: 'b.pourian@hotmail.co.uk')

    expect('password1').not_to eq(user.password_hash)
    end
  end
