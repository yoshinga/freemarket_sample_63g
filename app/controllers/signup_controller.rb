class SignupController < ApplicationController
  before_action :registration_validates, only: :sms_confirmation  #ページ遷移する前にバリデーションをかけるアクションを呼び出す
  before_action :address_validates, only: :credit_card
  before_action :credit_card_validates, only: :create
  def registration
    @user = User.new #新規インスタンス作成
  end

  def sms_confirmation
    session[:user_params_step1] = user_params #受け取った値を:user_params_step1に代入
    @user = User.new                          #新規インスタンス作成
  end
  
  def address
    @user = User.new                          #新規インスタンス作成
    @user.build_address                       #addressモデルに関連付け
  end
  
  def credit_card
    session[:user_params_step2] = user_params #受けとった値をsession[:user_params_step2]に代入 userテーブルに送るカラム
    session[:address_attributes] = user_params[:address_attributes] #受けとった値をsession[:address_attributes]に代入 addressテーブルに送るカラム
    @user = User.new                          #新規インスタンス作成
    @user.build_address
  end
    
  def create  
    session[:user_params_step3] = user_params   #受けとった値をsession[:user_params_step3]に代入
    session[:user_params_step3].merge!(session[:user_params_step1]).merge!(session[:user_params_step2]) #session[:user_params_step3]に前ページで入力した情報を結合
    @user = User.new(session[:user_params_step3]) #インスタンスにuserテーブルに送る情報の全てを代入
    # @user.build_address(session[:address_attributes])#入力値を引数で渡す
    
    if @user.save
      session[:id] = @user.id   #doneアクションでログインする用にsession[:id]に@user.id を代入
      redirect_to done_signup_index_path    #saveできたらdoneアクションに遷移
    else
      redirect_to registration_signup_index_path   #saveできなかったら最初の入力フォームに戻る
    end
      
  end

  def done
      sign_in User.find(session[:id]) unless user_signed_in?  #user_signed_in? ができたらユーザーに:idを渡してログイン！
  end

  def registration_validates #registrationで入力された情報のバリデーションチェックをするためのアクション

    session[:nickname] = user_params[:nickname]     #createアクションに渡すためにsessiionに代入
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]

    @user = User.new(                                #バリデーションチェックをするためにインスタンスを作成
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: "山田",                            #presence trueのバリデーションに引っかかるので、仮置き↓
      first_name: "彩",
      family_kana_name: "ヤマダ",
      first_kana_name: "アヤ",
      telephone_number: "01234567890",
      card_number: "01234567890",
      month: "01",
      year: "23",
      code: "012"
    )
      render '/signup/registration' unless @user.valid? method: :post #仮で作成したインスタンスのバリデーションチェック
  end

  def address_validates

    session[:family_name] = user_params[:family_name]      #createアクションに渡すためにsessiionに代入
    session[:first_name] = user_params[:first_name]
    session[:family_kana_name] = user_params[:family_kana_name]
    session[:first_kana_name] = user_params[:first_kana_name]
    session[:postal_code] = user_params[:address_attributes][:postal_code]
    session[:prefecture] = user_params[:address_attributes][:prefecture]
    session[:city] = user_params[:address_attributes][:city]
    session[:house_number] = user_params[:address_attributes][:house_number]
    session[:building_name] = user_params[:address_attributes][:building_name]
    session[:telephone_number] = user_params[:telephone_number]
    @user = User.new(                                     #バリデーションチェックをするためにインスタンスを作成
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_kana_name: session[:family_kana_name],
      first_kana_name: session[:first_kana_name],
      telephone_number: session[:telephone_number],
      card_number: "01234567890",                          #presence trueのバリデーションに引っかかるので、仮置き↓
      month: "01",
      year: "23",
      code: "012"
    )
      @address = Address.new(                             #バリデーションチェックをするためにインスタンスを作成
      postal_code: session[:postal_code],
      prefecture: session[:prefecture],
      city: session[:city],
      house_number: session[:house_number],
      building_name: session[:building_name]
    )
      redirect_to '/signup/address' unless @user.valid? && @address.valid?     #仮で作成したインスタンスのバリデーションチェック
  end

  def credit_card_validates
    session[:card_number] = user_params[:card_number]
    session[:month] = user_params[:month]
    session[:year] = user_params[:year]
    session[:code] = user_params[:code]

    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_kana_name: session[:family_kana_name],
      first_kana_name: session[:first_kana_name],
      telephone_number: session[:telephone_number],
      card_number: session[:card_number],
      month: session[:month],
      year: session[:year],
      code: session[:code]
      )
      redirect_to '/signup/credit_card' unless @user.valid?
  end
  private

  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation,
      :family_name,
      :first_name,
      :family_kana_name,
      :first_kana_name,
      :telephone_number,
      :card_number,
      :month,
      :year,
      :code,
      address_attributes:[
      :id,
      :postal_code, 
      :prefecture, 
      :city, 
      :house_number, 
      :building_name
      ])
  end
end