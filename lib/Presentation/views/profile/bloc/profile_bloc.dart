import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_event.dart';
import 'package:shop_app/Presentation/views/profile/bloc/profile_state.dart';

class ProfileBlocs extends Bloc<ProfileEvent, ProfileStates> {
  ProfileBlocs() : super(const ProfileStates()) {
    on<TriggerProfileName>(_triggerProfileName);
  }
  _triggerProfileName(TriggerProfileName event, Emitter<ProfileStates> emit) {
    emit(state.copyWith(userProfile: event.userProfile));
  }
}
