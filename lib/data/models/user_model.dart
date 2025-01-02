class UserModel {
  final String name;
  final String email;
  final String phoneNumber;
  final String links;
  final String extraInformations;
  final String password;
  final int? age;

  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.links,
    required this.extraInformations,
    required this.password,
    this.age,
  });
}
