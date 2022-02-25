class PublisherModel {
  PublisherModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory PublisherModel.fromMap(Map<String, dynamic> json) => PublisherModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
