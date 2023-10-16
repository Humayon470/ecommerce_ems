require 'csv'
class GenerateProductCsv
  include Interactor

  def call
    products = Product.ordered
    context.csv_data = CSV.generate(headers: true) do |csv|
      csv << %w[ID title Price Description Status]

      products.each do |product|
        csv << [product.id, product.title, product.price, product.description, product.status]
      end
    end
  end
end