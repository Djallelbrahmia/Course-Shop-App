import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/settings/bloc/settings.events.dart';
import 'package:shop_app/Presentation/views/profile/settings/bloc/settings_states.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates> {
  SettingsBlocs() : super(const SettingsStates()) {
    on<TriggerSettings>(_triggerSettings);
  }

  void _triggerSettings(TriggerSettings event, Emitter<SettingsStates> emit) {
    emit(const SettingsStates());
  }
}
