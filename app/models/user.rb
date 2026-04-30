class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :birth_date, presence: true
    validates :cpf, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password_digest, presence: true
end
