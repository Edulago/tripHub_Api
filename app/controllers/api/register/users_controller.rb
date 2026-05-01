module Api 
    module Register
        class UsersController < ApplicationController
            def index
                user = User.all
                render json: user.as_json(only: [:first_name, :last_name, :birth_date, :cpf, :passport, :email, :active])
            end

            def show 
                user = User.find(params[:id])
                render json: user.as_json(only: [:first_name, :last_name, :birth_date, :cpf, :passport, :email, :active])
            end

            def create
                user = User.new(user_params)
                if user.save
                    render json: user.as_json(only: [:first_name, :last_name, :birth_date, :cpf, :passport, :email, :active]), status: :created
                else
                    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
                end
            end

            def update
                user = User.find(params[:id])
                if user.update(user_params)
                    render json: user.as_json(only: [:first_name, :last_name, :birth_date, :cpf, :passport, :email, :active])
                else
                    render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
                end
            end

            def destroy
                user = User.find(params[:id])
                user.update(active: false)
                head :no_content
            end

            private

            def user_params
                params.require(:user).permit(:first_name, :last_name, :birth_date, :cpf, :passport, :email, :password_digest)
            end
        end
    end
end