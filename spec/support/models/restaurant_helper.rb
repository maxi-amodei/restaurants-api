module RestaurantHelper
  def create_restaurant(email, password, name, address)
    user = User.create!(email: email, password: password)
    Restaurant.create!(name: name, address: address, user: user)
  end
end