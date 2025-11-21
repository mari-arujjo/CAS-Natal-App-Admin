class AppUserModel {
  final String? id;
  final String fullName;
  final String userName;
  final String email;
  final String? password;
  final String? phoneNumber;
  final String? token;
  final String? privateRole;

  AppUserModel({
    this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    this.password,
    this.phoneNumber,
    this.token,
    this.privateRole
  });

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      id: map['id'],
      fullName: map['name'] ?? map['fullName'] ?? '',
      userName: map['username'] ?? map['userName'] ?? '',
      email: map['email'] ?? '',
      password: map['passwordHash'],
      phoneNumber: map['phoneNumber'],
      token: map['token'],
      privateRole: map['privateRole'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullName': fullName,
      'username': userName,
      'email': email,
      'passwordHash': password,
      'phoneNumber': phoneNumber,
      'token': token,
      'privateRole': privateRole
    };
  }
}