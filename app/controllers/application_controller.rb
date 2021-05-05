class ApplicationController < ActionController::API
  before_action :authorized
  
  def encode_token(payload)
    # should store secret in env variable
    JWT.encode(payload, 'my_s3cr3t')
  end
  
  def auth_header
    # { Authorization: 'Bearer <token>' }
    # byebug
    request.headers['Authorization']
    # request.params[:token]
  end
  
  def decoded_token
    # byebug
    if auth_header
      token = auth_header.split(' ')[1]
      # header: { 'Authorization': 'Bearer <token>' }
      begin
        JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
  
  def current_user
    # byebug
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end
  
  def logged_in?
    # byebug
    !!current_user
  end
  
  def authorized
    # byebug
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end


