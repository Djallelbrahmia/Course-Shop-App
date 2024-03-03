import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_events.dart';
import 'package:shop_app/Presentation/views/home/bloc/home_states.dart';

class HomePageBlocs extends Bloc<HomePageEvents, HomepageStates> {
  HomePageBlocs() : super(HomepageStates()) {
    on<HomePageDots>(_homePageDots);
  }
  void _homePageDots(HomePageDots event, Emitter<HomepageStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
