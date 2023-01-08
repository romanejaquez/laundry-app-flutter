class OrderModel {
  final String id;
  final String orderId;
  final String description;
  final DateTime created;

  OrderModel({
    required this.id,
    required this.orderId,
    required this.description,
    required this.created
  });

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'created': created.toIso8601String(),
      'description': description
    };
  }

  factory OrderModel.fromJson(Map<String, dynamic> json, String docId) {
    return OrderModel(
      id: docId,
      orderId: json['orderId'],
      description: json['description'],
      created: DateTime.parse(json['created'])
    );
  }
}