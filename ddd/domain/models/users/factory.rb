module Users
  class Factory
    class << self
      def build(user)
        return guest_user if user.nil?

        Users::User.new(
          id: user.id,
          email: user.email,
          name: user&.user_profile&.name || "ユーザーID #{user.id}",
          image: user&.user_profile&.image || '/default_user_image.png',
          introduction: user&.user_profile&.introduction || '',
          background_image: user&.user_profile&.background_image || '/default_user_background_image.png'
        )
      end

      def guest_user
        Users::User.new(
          id: 0,
          email: 'guest',
          name: 'ゲスト',
          introduction: 'ゲスト',
          image: 'guest.jpg',
          background_image: 'guest.jpg'
        )
      end
    end
  end
end
