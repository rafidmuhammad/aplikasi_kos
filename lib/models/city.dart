class City {
  int id;
  String location;
  String imageUrl;
  bool isFavorite;

  City(
      {required this.id,
      required this.location,
      required this.imageUrl,
      this.isFavorite = false});
}
