import 'dart:convert';

class Profile {
  int id;
  String name;
  String email;

  // constructor
  Profile({this.id, this.name, this.email});

  // convert from json to profile
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "email": email};
  }

  @override
  String toString() {
    return 'Profile{id: $id, name: $name, email: $email}';
  }
}


List<Profile> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Profile>.from(data.map((item) => Profile.fromJson(item)));
}

String profileToJson(Profile data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
