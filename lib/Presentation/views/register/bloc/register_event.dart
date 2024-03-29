abstract class RegisterEvent {
  const RegisterEvent();
}

class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent(this.email);
}

class UsernameEvent extends RegisterEvent {
  final String userName;
  const UsernameEvent(this.userName);
}

class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent(this.password);
}

class RePasswordEvent extends RegisterEvent {
  final String rePassword;
  const RePasswordEvent(this.rePassword);
}
