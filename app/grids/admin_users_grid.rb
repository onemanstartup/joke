class AdminUsersGrid
  include Datagrid
  scope { User }
  filter :id, :integer, header: 'Идентификатор'

  filter(:email, :string, header: 'Почта') do |value|
    where("email ilike '%#{value}%'")
  end

  filter :created_at, :date,
                      range: true,
                      header: 'Дата регистрации',
                      default: proc { [6.month.ago.to_date, Date.today] }

  column :id
  column(:created_at, header: 'Дата регистрации') { |user| user.created_at }
  column(:admin, header: 'Админ') { |user| user.admin? }

  column(:actions,    header: 'Действия')

  def title
    'Пользователи'
  end
end
