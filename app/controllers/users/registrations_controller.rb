# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.build_confirm
  end

  # POST /resource
  def create
    # デバッグ用の表示です。
    # p "---registration-create---"
    # p params.require(:user).require(:confirm_attributes)["birthday(1i)"]
    # p params.require(:user).require(:confirm_attributes)["birthday(1i)"].class
    # p params.require(:user).require(:confirm_attributes)["birthday(2i)"]
    # p params.require(:user).require(:confirm_attributes)["birthday(2i)"].class
    # p params.require(:user).require(:confirm_attributes)["birthday(3i)"]
    # p params.require(:user).require(:confirm_attributes)["birthday(3i)"].class
    
    # まず、params.require(:user).require(:confirm_attributes)["birthday(2i)"]が1桁なら、2桁にする処理をします。
    if params.require(:user).require(:confirm_attributes)["birthday(2i)"].length==1
      # デバッグ用の表示です。
      # p "birthday(2i) -- is 1 length! changing 2 length"
      params.require(:user).require(:confirm_attributes)["birthday(2i)"]=(0.to_s+params.require(:user).require(:confirm_attributes)["birthday(2i)"])
      # p params.require(:user).require(:confirm_attributes)["birthday(2i)"]
    end
    
    # 次に、params.require(:user).require(:confirm_attributes)["birthday(3i)"]が1桁なら、同様に処理します。
    if params.require(:user).require(:confirm_attributes)["birthday(3i)"].length==1
      # デバッグ用の表示です。
      # p "birthday(3i) -- is 1 length! changing 2 length"
      params.require(:user).require(:confirm_attributes)["birthday(3i)"]=(0.to_s+params.require(:user).require(:confirm_attributes)["birthday(3i)"])
      # p params.require(:user).require(:confirm_attributes)["birthday(3i)"]
    end

    #params.require(:user).require(:confirm_attributes)["birthday(1i)"]はString型なので、2iと文字列結合。さらにその後3iとも結合します。 
    params.require(:user).require(:confirm_attributes)["birthday(1i)"].concat(params.require(:user).require(:confirm_attributes)["birthday(2i)"])
    params.require(:user).require(:confirm_attributes)["birthday(1i)"].concat(params.require(:user).require(:confirm_attributes)["birthday(3i)"])
    # デバッグ用の表示です。
    # p "---concated-birthday1i---"
    # p params.require(:user).require(:confirm_attributes)["birthday(1i)"]
    
    # 結合結果の1iを、params.require(:user).require(:confirm_attributes)[:birthday]でbirthdayというキーを作り、値として挿入
    params.require(:user).require(:confirm_attributes)[:birthday]=params.require(:user).require(:confirm_attributes)["birthday(1i)"]
    # 結合したのでparams.require(:user).require(:confirm_attributes)["birthday(2i)"]と3iをけします。
    params.require(:user).require(:confirm_attributes).delete("birthday(2i)")
    params.require(:user).require(:confirm_attributes).delete("birthday(3i)")
    params.require(:user).require(:confirm_attributes).delete("birthday(1i)")
    
    # デバッグ用の表示です。
    # p "---insert-and-print-birday---"
    # p params.require(:user).require(:confirm_attributes)["birthday"]

    @user = User.new(user_params)
    @user.save!
    # binding.pry
    # 上まではuserテーブルに保存する方法でした。
    # @confirm=Confirm.new(confirm_params)
    # @confirm.save!
    # p "----confirmed----"


    # 現在このcreateアクションの終了後のビューの表示(下のredirect_to)を単純にコメントアウトを外すとエラーでした。
    # 調整願えますでしょうか(アダチ)
<<<<<<< HEAD
    redirect_to  root_path
=======
    # redirect_to user_session_path(@user)
    redirect_to new_address_path
>>>>>>> 04ad37380c7cb03d4a0a1793e47173c4197a911f
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected
  private

  def user_params
    params.require(:user).permit(:nikname, :email,:password,confirm_attributes:[:id, :name_last_name, :name_first_name, :last_name_kana, :first_name_kana , :birthday])
  end

  def confirm_params
    params.require(:user).require(:confirm_attributes).permit(:id, :name_last_name, :name_first_name, :last_name_kana, :first_name_kana , :birthday[1i])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  
end
