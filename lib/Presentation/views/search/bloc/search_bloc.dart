import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_event.dart';
import 'package:shop_app/Presentation/views/search/bloc/search_states.dart';

class SearchBloc extends Bloc<SearchEvents, SearchStates> {
  SearchBloc() : super(const SearchStates()) {
    on<TriggerSearchEvents>(_triggerSearchEvent);
  }
  _triggerSearchEvent(TriggerSearchEvents event, Emitter<SearchStates> emit) {
    emit(state.copyWith(courseItems: event.courseItems));
  }
}
