abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNav extends NewsStates {}

class GetBusinessLoadingState extends NewsStates {}

class GetBusinessSuccessState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final error;

  GetBusinessErrorState(this.error);
}

class GetSportsSuccessState extends NewsStates {}

class GetSportsLoadingState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final error;

  GetSportsErrorState(this.error);
}

class GetScienceLoadingState extends NewsStates {}

class GetScienceSuccessState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final error;

  GetScienceErrorState(this.error);
}

class GetSearchLoadingState extends NewsStates {}

class GetSearchSuccessState extends NewsStates {}

class GetSearchErrorState extends NewsStates {
  final error;

  GetSearchErrorState(this.error);
}
