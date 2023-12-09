import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';

Store<AppState> store = Store<AppState>(
  initialState: AppState.init(),
);
