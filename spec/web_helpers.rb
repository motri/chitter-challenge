def sign_up
  visit '/'
  fill_in :name, with: 'Unai Motriko Gomez'
  fill_in :email, with: 'unaimotriko@electromail.org'
  fill_in :user_name, with: 'euskaldun'
  fill_in :password, with: 'gakoa'
  fill_in :password_confirmation, with: 'gakoa'
  click_on 'Join'
end

def login
  visit '/'
  fill_in :email, with: 'unaimotriko@electromail.org'
  fill_in :password, with: 'gakoa'
  click_on 'Log in'
end
