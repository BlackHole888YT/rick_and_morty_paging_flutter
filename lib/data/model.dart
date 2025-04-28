class Model {
  final String name;
  final String status;
  final String image;

  Model({
    required this.image,
    required this.name,
    required this.status
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        name: json['name'],
        status: json['status'],
        image: json['image'],
    );
  }
}