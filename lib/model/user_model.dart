class UserModel {
  String id;
  String name;
  String phone;
  String gender;
  String city;

  UserModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.gender,
      required this.city});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      gender: json['gender'] as String,
      city: json['city'] as String,
    );
  }
  Map<String, dynamic> toJsonAdd() {
    return {
      "name": name,
      "phone": phone,
      "gender": gender,
      "city": city,
    };
  }

    Map<String, dynamic> toJsonUpdate() {
    return {
      "id": id,
      "name": name,
      "phone": phone,
      "gender": gender,
      "city": city,
    };
  }
}
