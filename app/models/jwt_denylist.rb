# rubocop:disable Layout/EndOfLine
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end
# rubocop:enable Layout/EndOfLine
