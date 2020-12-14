class ItemsController < ApplicationController

  def index
    @items = Item.all
  end  

   
end


# ①ターミナルで以下のコマンドをうちましょう
# git add . → git commit -m ’firstcommit’ → git push heroku master 

# ②heroku run rails db:migrate:reset RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1
# → heroku run rails db:migrate