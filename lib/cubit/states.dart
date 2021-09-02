abstract class NewsStates {}

class NewInitialState extends NewsStates {}

class NewBottomNavState extends NewsStates {}

class NewGetBusinessLoadState extends NewsStates {}

class NewGetBusinessSuccessState extends NewsStates {}

class NewGetBusinessErrorState extends NewsStates {
  final String error;
  NewGetBusinessErrorState(this.error
  );
}

class NewGetSportLoadState extends NewsStates {}

class NewGetSportSuccessState extends NewsStates {}

class NewGetSportErrorState extends NewsStates {
  final String error;
  NewGetSportErrorState(this.error
  );
}

class NewGetScienceLoadState extends NewsStates {}

class NewGetScienceSuccessState extends NewsStates {}

class NewGetScienceErrorState extends NewsStates {
  final String error;
  NewGetScienceErrorState(this.error
  );
}


class NewChangeModeState extends NewsStates {}

class NewGetSearchLoadState extends NewsStates {}

class NewGetSearchSuccessState extends NewsStates {}

class NewGetSearchErrorState extends NewsStates {
  final String error;
  NewGetSearchErrorState(this.error
  );
}

