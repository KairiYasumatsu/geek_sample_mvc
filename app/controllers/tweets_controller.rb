class TweetsController < ApplicationController
 def index
   @tweets = Tweet.all
 end

 def new
   @tweet = Tweet.new
 end

 def create
   @tweet = Tweet.new(tweet_params)

  #新しいTweetの保存に成功した場合
  if @tweet.save
    #index.html.erbにページが移る
    redirect_to action: "index"
  #新しいTweetの保存に失敗した場合
  else
    #もう一回投稿画面へ
    redirect_to action: "new"
  end
 end

 private
 #セキュリティのため、許可した:bodyというデータだけ取ってくるようにする
 def tweet_params
  params.require(:tweet).permit(:body)
 end
end
