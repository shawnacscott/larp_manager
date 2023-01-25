class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
  end

  # GET /users/1
  def show
    @user = authorize User.find(params[:id])
  end

  # # GET /users/1/edit
  # def edit; end

  # # POST /users
  # def create
  #   @users = users.new(users_params)

  #   if @user.save
  #     redirect_to @user, notice: "User was successfully created."
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # # PATCH/PUT /users/1
  # def update
  #   if @user.update(user_params)
  #     redirect_to users_path, notice: "User was successfully updated."
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /users/1
  # def destroy
  #   @user.destroy
  #   redirect_to users_url, notice: "User was successfully destroyed."
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:email, role_ids: [])
  # end
end
