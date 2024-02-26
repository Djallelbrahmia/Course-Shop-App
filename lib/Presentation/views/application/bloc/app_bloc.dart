import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_events.dart';
import 'package:shop_app/Presentation/views/application/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(const AppStates(index: 0)) {
    on<TriggerAppEvent>((event, emit) => emit(AppStates(index: event.index)));
  }
}
