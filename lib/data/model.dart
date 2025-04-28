class Model {
  final String name;
  final String status;
  final String image;
  final int id;

  Model({
    required this.image,
    required this.name,
    required this.status,
    required this.id,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        name: json['name'],
        status: json['status'],
        image: json['image'],
        id: json['id'],
    );
  }
}