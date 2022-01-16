class Api::V1::AccountsController < ApplicationController

    def index
        @accounts = Account.all
        render json: @accounts
    end

    def show
        begin
            if params[:id]
                @account = Account.find(params[:id])
                render json: @account
            else
                self.index
            end
        rescue => err
            # debugger
            render json: { message: err.message }, status: 404
        end
    end

    def create
        begin
            if signup_params && !params[:username]
                @findaccount = Account.find_by(signup_params)
                render json: @findaccount, status: 200
            elsif login_params
                @account = Account.new(login_params)
                @add = @account.save
                render json: @add, status: 201
            end
        rescue => err
            # debugger
            render json: { message: err.message }, status: 409
        end
    end



    private

    def login_params
        params.require(:account).permit(:username, :email, :password)
    end

    def signup_params
        params.require(:account).permit(:email, :password)
    end

end
