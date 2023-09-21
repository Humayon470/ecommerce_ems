require 'csv'
class GenerateUserCsv
  include Interactor

  def call
    context.csv_data = CSV.generate(headers: true) do |csv|
      csv << ["ID", "Name", "Email", "Role"]

      context.users.each do |user|
        csv << [user.id, user.name, user.email, user.role]
      end
    end
  end
end