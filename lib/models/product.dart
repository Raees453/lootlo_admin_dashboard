class Product {
  final String id;
  final String title;
  final String description;
  int quantity;
  int price;
  final List<String> imageUrls;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageUrls,
  });
}
