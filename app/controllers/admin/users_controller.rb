class Admin::UsersController < AdminController
  actions :all, except: [:create, :new, :show]
  include Griddable
  index_title 'Пользователи'
end
