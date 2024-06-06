class Hotel {
  final String name;
  final List<String> image;
  final int price;
  final double rating;
  final String location;
  final String description;
  const Hotel(
    this.description, {
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.location,
  });
}
