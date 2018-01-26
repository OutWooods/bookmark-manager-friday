feature 'password encryption' do

  scenario 'user setup an account' do
    sign_up
    p User.all
    user = User.first(email: 'b.pourian@hotmail.co.uk')

    expect('password1').not_to eq(user.password_hash)
    end
  end
