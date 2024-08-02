class FieldData {
  final String cropType, variety, quantityUnit, note, image1, image2;
  final double price, quantity;

  const FieldData({
    required this.cropType,
    required this.variety,
    required this.quantity,
    required this.quantityUnit,
    required this.price,
    required this.note,
    required this.image1,
    required this.image2,
  });

  factory FieldData.fromMap(Map<String, dynamic> map) {
    return FieldData(
      cropType: map['crop_type'] ?? '',
      variety: map['variety'] ?? '',
      quantity: double.parse(map['quantity'] ?? '0'),
      quantityUnit: map['quantity_unit'] ?? '',
      price: double.parse(map['price'] ?? '0'),
      note: map['note'] ?? '',
      image1: map['image1'] ?? '',
      image2: map['image2'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'crop_type': cropType,
      'variety': variety,
      'quantity': quantity,
      'quantity_unit': quantityUnit,
      'price': price,
      'note': note,
      'image1': image1,
      'image2': image2,
    };
  }
}
