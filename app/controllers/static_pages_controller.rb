class StaticPagesController < ApplicationController

  def home
  	#client = Twitter::REST::Client.new do |config|
	  #config.consumer_key = 'P3yk6A0OwYE4gnBkLPs7Z2QYJ'
	  #config.consumer_secret = '3qdjppyo6LhZ4Ca1Cx83wTLdoXE7RBMgaB7hSEEfnqwW8zd2G3'
	 # config.access_token = ENV['41815371-xE9Q9UXNlhzkhLzR6Bpy9Nvrnu4Nnpc4a106xTfh7']
	  #config.access_token_secret = ENV['GKo4dzjs80JxJ76VJukDHfeRbWRIUKN3lVLNfSk5CCEyJ']
	 # end 
	  	#byebug
  	#@twitter_user = '@izonezw'
  	#@tweet_news = client.user_timeline(@twitter_user, {count: 3})
  	#@tweet_news=client.user_timeline("schisepo")
  	#byebug
  end
  def sendcontact
    UserMailer.contact_us(params[:name],params[:email],params[:phone],params[:message]).deliver_now
    redirect_to(root_url)
  end
  def edit
  end

  def help
  end

  def about
  end

  def contact
  end
  def twitter_news
	  account = Settings['twitter']
	 
	  Twitter.configure do |config|
	  config.consumer_key = ENV['P3yk6A0OwYE4gnBkLPs7Z2QYJ ']
	  config.consumer_secret = ENV[' 3qdjppyo6LhZ4Ca1Cx83wTLdoXE7RBMgaB7hSEEfnqwW8zd2G3']
	  config.access_token = ENV['41815371-xE9Q9UXNlhzkhLzR6Bpy9Nvrnu4Nnpc4a106xTfh7']
	  config.access_token_secret = ENV['GKo4dzjs80JxJ76VJukDHfeRbWRIUKN3lVLNfSk5CCEyJ']
	  end 
  end
end
