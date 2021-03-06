class CardController < ApplicationController
  before_action :authenticate_user!
  
  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay 
    puts "card_pay--1"
    logger.info 'card_pay--1'
    # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # 上のENVで読み込めていない様子なので、Rails.application.credentials[:payjp_private_key]として、credentials.yml.encの内容を読むことにします。
    Payjp.api_key = Rails.application.credentials[:payjp_private_key]
    puts "card_pay--2"
    logger.info 'card_pay--2'
    if params['payjp-token'].blank?
      redirect_to new_card_path, notice: '必須項目が入力されていません。すべての必須項目を入力してください。'
    else
      # デバッグ用表示部分
      puts "card_pay--3"
      logger.info 'card_pay--3'
      logger.info "current_user.id = #{current_user.id}"
      logger.info "params = #{params}"
      logger.info "Payjp.api_key = #{Payjp.api_key}"
      logger.info "ENV['PAYJP_PRIVATE_KEY'] =#{ENV['PAYJP_PRIVATE_KEY']}"#=>secrets.yml.encを使用しているのでENV['PAYJP_PRIVATE_KEY']はRails.application.credentials[:payjp_private_key]に取って代わります。
      puts "ENV['PAYJP_PRIVATE_KEY'] =#{ENV['PAYJP_PRIVATE_KEY']}"
      logger.info "ENV['PAYJP_KEY'] =#{ENV['PAYJP_KEY']}"
      puts "ENV['PAYJP_KEY'] =#{ENV['PAYJP_KEY']}"
      logger.info "ENV=#{ENV}"
      
      #本番環境はこの下のPayjp::Customer.createでエラー見たいなので、デバッグ用にいろいろログに書いています。--------
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      puts "card_pay--4"
      logger.info 'card_pay--4'
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        puts "card_pay--5"
        logger.info 'card_pay--5'
        # redirect_to action: "show"
        redirect_to card_path(@card.id)
      else
        puts "card_pay--6"
      logger.info 'card_pay--6'
        # カード登録の際にエラーが出たら、再度、登録画面に戻し増す。
        redirect_to new_card_path, notice: 'カード登録時にエラーが発生しました。'

      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.present?
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # できれば直接apiキーを書きたくないので、Rails.application.credentials[:payjp_private_key]として、credentials.yml.encの内容を読むことにします。
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to action: "new" 
    else
      # Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # できれば直接apiキーを書きたくないので、Rails.application.credentials[:payjp_private_key]として、credentials.yml.encの内容を読むことにします。
      Payjp.api_key = Rails.application.credentials[:payjp_private_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end
end
