class AuthorModel {
  AuthorModel({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory AuthorModel.fromMap(Map<String, dynamic> json) => AuthorModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
