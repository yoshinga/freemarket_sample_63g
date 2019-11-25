class SignupController < ApplicationController
  
  def registration
    @user = User.new #新規インスタンス作成
  end

  def sms_confirmation
  end

  def address
  end

  def credit_card
  end

  def done
  end

end
