class RegisterStates {
  String userName, email, password, rePassword;
  RegisterStates(
      {required this.userName,
      required this.email,
      required this.password,
      required this.rePassword});
  RegisterStates copyWith(
      {String? userName, String? email, String? password, String? rePassword}) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        rePassword: rePassword ?? this.rePassword);
  }
}
