module Users
  class User
    attr_reader :id
    attr_reader :email
    attr_reader :name
    attr_reader :introduction
    attr_reader :image
    attr_reader :background_image

    def initialize(params)
      @id = params.fetch(:id)
      @email = params.fetch(:email)
      @name = params.fetch(:name)
      @introduction = params.fetch(:introduction)
      @image = params.fetch(:image)
      @background_image = params.fetch(:background_image)
    end
  end
end
