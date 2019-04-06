class ImportersController < ApplicationController
  def index
    @importers = Importer.includes(purchases: [:purchaser, :item, :purchaser, :merchant]).all.distinct.paginate(page: params[:page]).order(created_at: :desc)
    @impoters_gross_value_sum = Importer.all.sum(:gross_value).to_f
  end

  def new
    @importer = Importer.new
  end

  def create
    @importer = Importer.new importer_params

    if @importer.save
      redirect_to importers_path
    else
      render :new
    end
  end

  private

  def importer_params
    params.fetch(:importer, {}).permit(:file)
  end
end
