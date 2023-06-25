class SignUpModel {
  SignUpModel({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });

  String name;
  String password;
  String email;
  String phone;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};

    data['f_name'] = name;
    data['password'] = password;
    data['email'] = email;
    data['phone'] = phone;

    return data;
  }
}
