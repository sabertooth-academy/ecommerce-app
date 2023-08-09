class User {
  int? id;
  String? userName;
  String? email;
  String? mobileNumber;
  String? address;
  String? token;

  User({this.id, this.userName, this.email, this.mobileNumber, this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userName = json['name'] ?? '';
    email = json['email'] ?? '';
    mobileNumber = json['mobileNumber'] ?? '';
    address = json['address'] ?? '';
    token = json['token'] ?? '';
  }

  toJson() {
    return {
      'id': id ?? 0,
      'name': userName ?? '',
      'email': email ?? '',
      'mobileNumber': mobileNumber ?? '',
      'address': address ?? '',
      'token': token ?? '',
    };
  }
}