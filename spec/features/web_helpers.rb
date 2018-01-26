def sign_up
  visit '/signup'
  fill_in('email', :with => 'b.pourian@hotmail.co.uk')
  fill_in('password', :with => 'password1')
  fill_in('password_confirmation', :with => 'password1')
  click_button 'submit'
end

def bad_sign_up
  visit '/signup'
  fill_in('email', :with => 'a.pourian@hotmail.co.uk')
  fill_in('password', :with => 'password1')
  fill_in('password_confirmation', :with => 'password2')
  click_button 'submit'
end
