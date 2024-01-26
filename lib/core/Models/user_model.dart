class UserModel {
  final String userName;
  final String email;

  UserModel({required this.userName, required this.email});

  // factory UserModel.fromJson(Map<String, dynamic> json) {
  //   return UserModel(
  //     username: json['username'],
  //     email: json['email'],
  //   );
  // }
}