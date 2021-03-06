module RestaurantHelper
  def create_restaurant(email, password, name, address)
    user = User.create!(email: email, password: password)
    Restaurant.create!(name: name, address: address, user: user)
  end

  def create_user(email, password)
    User.create!(email: email, password: password)
  end
end