import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/register/bloc/register_bloc.dart';
import 'package:shop_app/Presentation/views/sign-in/bloc/signin_bloc.dart';
import 'package:shop_app/Presentation/views/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBloc())
      ];
}
