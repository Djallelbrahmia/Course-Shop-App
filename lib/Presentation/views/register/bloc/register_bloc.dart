import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_event.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc()
      : super(RegisterStates(
            userName: "", email: "", password: "", rePassword: "")) {
    on<UsernameEvent>(_usernameEvent);

    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>(_passwordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _usernameEvent(UsernameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.rePassword);

    emit(state.copyWith(rePassword: event.rePassword));
  }
}
