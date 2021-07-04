module Users
  class Repository
    class << self
      def by_email(email)
        user = ::User.find_by(email: email)
        Users::Factory.build(user)
      end
    end
  end
end
