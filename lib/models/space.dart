class Space {
  int id;
  String name;
  int price;
  String imageUrl;
  String city;
  String country;
  int rating;
  String? address;
  String? phone;
  String? mapUrl;
  List? photos;
  int? numberOfKitchen;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  Space({
    required this.id,
    required this.name,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.imageUrl,
    this.address,
    this.mapUrl,
    this.numberOfBedrooms,
    this.numberOfCupboards,
    this.numberOfKitchen,
    this.phone,
    this.photos,
  });

  Space.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        city = json['city'],
        country = json['country'],
        imageUrl = json['image_url'],
        price = json['price'],
        photos = json['photos'],
        rating = json['rating'],
        address = json['address'],
        phone = json['phone'],
        mapUrl = json['map_url'],
        numberOfKitchen = json['number_of_kitchens'],
        numberOfBedrooms = json['number_of_bedrooms'],
        numberOfCupboards = json['number_of_cupboards'];
}
