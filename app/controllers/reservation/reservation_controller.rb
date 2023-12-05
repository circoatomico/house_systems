
module Reservation
  class ReservationController < ActionController::API
    before_action :authenticate_request

    def create
      immobile = Immobile::Immobile.find(params[:immobile_id])
      reservation = Reservation.new(immobile: immobile, user: @current_user)

      reservation.save!
      render json: reservation, status: :created
    end

    private

    def authenticate_request
      header = request.headers['Authorization']
      token = header.split(' ').last if header

      begin
        decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
        @current_user = User::User.find(decoded_token.first['user_id'])
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    end
  end
end