class Item {
  final String? id;
  final String? name;
  final num? price;

  Item(this.id, this.name, this.price);

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'price': price};
  }

  factory Item.fromJson(Map<String, dynamic> map) {
    return Item(map['id'], map['name'], map['price']);
  }
}
