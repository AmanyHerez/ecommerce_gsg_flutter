class AppUser {
  String? email;
  String? password;
  String? userName;
  String? city;
  String? phone;
  String? id;

  AppUser({
    required this.email,
    required this.password,
    required this.userName,
    required this.city,
    required this.phone,
  });

  AppUser.FromMap(Map<String, dynamic> map) {
    email = map[email] ?? " ";
    password = map[password] ?? " ";
    userName = map[userName] ?? " ";
    city = map[city] ?? " ";
    phone = map[phone] ?? " ";
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      '  password':   password,
      'userName': userName,
      'city': city,
      'phone': phone,
    };
  }
}
