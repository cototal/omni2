module Admin
  class Allowance::EntriesController < AdminController
    before_action :set_allowance_entry, only: [:show, :edit, :update, :destroy]

    def index
      @q = ::Allowance::Entry.ransack(params[:q])
      @q.sorts = "entry_date desc" if @q.sorts.empty?
      @allowance_entries = @q.result(uniq: true).includes(:user).paginate(page: params[:page], per_page: 20)
    end

    def show
    end

    def new
      @allowance_entry = current_user.allowance_entries.build
    end

    def edit
    end

    def create
      @allowance_entry = current_user.allowance_entries.build(allowance_entry_params)

      respond_to do |format|
        if @allowance_entry.save
          format.html { redirect_to [:admin, @allowance_entry], notice: "Entry was successfully created." }
          format.json { render :show, status: :created, location: @allowance_entry }
        else
          format.html { render :new }
          format.json { render json: @allowance_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @allowance_entry.update(allowance_entry_params)
          format.html { redirect_to [:admin, @allowance_entry], notice: "Entry was successfully updated." }
          format.json { render :show, status: :ok, location: @allowance_entry }
        else
          format.html { render :edit }
          format.json { render json: @allowance_entry.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @allowance_entry.destroy
      respond_to do |format|
        format.html { redirect_to admin_allowance_entries_url, notice: "Entry was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    def autocompleter
      @payees = ::Allowance::Entry.all.map(&:payee).reject(&:blank?).uniq
      @categories = ::Allowance::Entry.all.map(&:category).reject(&:blank?).uniq
      respond_to do |format|
        format.json { render json: { payees: @payees, categories: @categories }.to_json }
      end
    end

    def merge
      @allowance_entries = ::Allowance::Entry.all
    end

    def merger
      valid_params = { category: params[:category], payee: params[:payee] }
      valid_params.reject! { |_k, v| v[:to].blank? || v[:from].blank? }
      valid_params.each do |key, value|
        ::Allowance::Entry.merge(key, value[:from], value[:to])
      end
      redirect_to merge_admin_allowance_entries_path
    end

    private

      def set_allowance_entry
        @allowance_entry = ::Allowance::Entry.find(params[:id])
      end

      def allowance_entry_params
        params.require(:allowance_entry).permit(:entry_date, :price, :payee, :category, :notes)
      end
  end
end
