Warden::Manager.after_set_user do |user, auth, opts|
  User.current = user
end