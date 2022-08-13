class Product {
  String? id;
  String? name;
  String? description;
  String? image;
  num? price;
  int? quantity;

  Product({
    this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
  });

  Product.FromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    price = map['price'];
    image = map['image'];
    quantity = map['quantity'];
  }

  toMap() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'quantity': quantity,
    };
  }
}
