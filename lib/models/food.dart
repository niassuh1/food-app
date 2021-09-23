class Food {
  Food({
    required this.imageUrl,
    required this.price,
    required this.name,
    required this.rating,
    required this.energy,
    this.spec = '',
  });
  final String imageUrl;
  final double price;
  final String name;
  final double rating;
  final int energy;
  final String spec;
}
