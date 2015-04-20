# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Nie wiem dlaczego, ale User.create nie chce z jakiegoś powodu działać
# poniżej przykladowy admin w kodzie SQL, hasło to 'Qwer1234'

# INSERT INTO `users` (`id`, `name`, `surname`, `email`, `encrypted_password`, `reset_password_token`, `reset_password_sent_at`, `remember_created_at`, `sign_in_count`, `current_sign_in_at`, `last_sign_in_at`, `current_sign_in_ip`, `last_sign_in_ip`, `created_at`, `updated_at`, `admin`) VALUES
# (1, 'QWER', 'Asdf', 'qwer@qwer.com', '$2a$10$hD9hQeGlX1vBMHwWp0lnoeK4Q/tZ5OU2m3T0.q3yEa8zX1s4tYYIi', NULL, NULL, NULL, 4, '2015-03-30 18:50:32', '2015-03-30 18:26:46', '127.0.0.1', '127.0.0.1', '2015-03-30 16:34:06', '2015-03-30 18:55:21', 1)
unless User.any?
	puts "Dodaje Admina"
  User.create!(
  name: 'QWER',
  surname: 'Asdf',
  email: 'qwer@qwer.com',
  password: 'Qwer1234',
  password_confirmation: 'Qwer1234',
  admin: '1')
end