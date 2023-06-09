class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    @pagy, @users = pagy(User.search(params), items: per_page, page: params[:page])
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('notification', partial: 'shared/notification',
                                                 locals: { notice: 'User was successfully created.' }),
            turbo_stream.replace('user_form', partial: 'users/form', locals: { user: User.new })
          ]
        end
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.update('notification', partial: 'shared/notification',
                                                 locals: { notice: 'User was successfully updated.' }),
            turbo_stream.replace('user_form', partial: 'users/form', locals: { user: @user })
          ]
        end
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.update('notification', partial: 'shared/notification',
                                               locals: { notice: 'User was successfully deleted.' }),
          turbo_stream.remove(@user)
        ]
      end
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def bulk_destroy
    return unless params[:users]
    User.where(id: params[:users]).destroy_all

    respond_to do |format|
      ts = [turbo_stream.update('notification', partial: 'shared/notification',
                                                 locals: { notice: 'Successfully destroyed users.' })]

      params[:users].each do |id|
        ts.push(turbo_stream.remove("user_#{id}"))
      end

      format.turbo_stream do
        render turbo_stream: ts
      end
      format.html { redirect_to users_url, notice: 'Successfully destroyed users.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:firstName, :lastName, :age, :gender, :email, :height, :weight)
  end
end
