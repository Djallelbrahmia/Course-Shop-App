class HomepageStates {
  int index;
  HomepageStates({this.index = 0});
  HomepageStates copyWith({int? index}) {
    return HomepageStates(index: index ?? this.index);
  }
}
