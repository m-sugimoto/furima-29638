class ApplicationController < ActionController::Base
before_action :basic_auth

def index
  @posts = Post.all.order(id: "DESC")
end

def create
  Post.create(content: params[:content])
  redirect_to action: :index
end

private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
    username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

end
