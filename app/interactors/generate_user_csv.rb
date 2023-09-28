require 'csv'

class GenerateUserCsv
  include Interactor

  def call
    users = User.user.ordered
    context.csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[ID Name Email Role]

      users.each do |user|
        csv << [user.id, user.name, user.email, user.role]
      end
    end
  end
end
