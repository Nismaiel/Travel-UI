class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  int rating;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
    this.rating
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Four Seasons',
    address: '404 Great St',
    price: 175,
    rating: 5
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Sphinx',
    address: '404 Great St',
    price: 300,
    rating: 4
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Pahamas',
    address: '404 Great St',
    price: 240,
      rating: 3,
  ),
];