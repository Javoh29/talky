class UserDataModel {
  final String? name;
  final String? description;
  final String? image;

  const UserDataModel({
    this.name,
    this.description,
    this.image,
  });

  factory UserDataModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      UserDataModel(
        name: json['name'],
        description: json['description'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
