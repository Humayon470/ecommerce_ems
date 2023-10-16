class Admin::CouponsController < AdminController
  before_action :find_coupon, only: %i[show edit destroy]

  def index
    @pagy, @coupons = pagy(Coupon.search(params[:search], params[:sort], params[:direction]), items: 5)
  end

  def new
    @coupon = Coupon.new
  end

  def create
    result = CreateCoupon.call(coupon_params: coupon_params)

    if result.success?
      redirect_to admin_coupons_path, notice: 'Coupon was successfully created.'
    else
      flash[:alert] = result.message
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    result = UpdateCoupon.call(coupon_params: coupon_params, id: params[:id])

    if result.success?
      redirect_to admin_coupons_path, notice: 'Coupon was successfully Updated.'
    else
      flash[:alert] = result.message
      render :edit
    end
  end

  def destroy
    @coupon.destroy
  end

  def export_csv
    result = GenerateCouponCsv.call

    respond_to do |format|
      format.csv do
        send_data result.csv_data, filename: 'coupon.csv'
      end
    end
  end

  private

  def coupon_params
    params.require(:coupon).permit(:name, :value, product_ids: [])
  end

  def find_coupon
    @coupon = Coupon.find(params[:id])
  end
end