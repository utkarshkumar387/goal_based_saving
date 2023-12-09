import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:fello_hackathon/modules/journey/actions/journey_actions.dart';
import 'package:fello_hackathon/modules/journey/model/journey_model.dart';
import 'package:fello_hackathon/modules/journey/widgets/widgets/ongoing_tab_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class OngoingTabViewConnector extends StatelessWidget {
  const OngoingTabViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      onInit: (store) {
        store.dispatch(
          GetOngoingGoalsResponse(),
        );
      },
      builder: (context, snapshot) {
        return OngoingTabView(
            journeyOngoingResponse: snapshot.journeyOngoingResponse);
      },
    );
  }
}

class _ViewModel extends Vm {
  final List<GoalDetailsModel> journeyOngoingResponse;

  _ViewModel({
    required this.journeyOngoingResponse,
  }) : super();
}

class _ViewModelFactory extends VmFactory<AppState, OngoingTabViewConnector> {
  _ViewModelFactory(OngoingTabViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        journeyOngoingResponse:
            state.journeyState.ongoingGoalsResponse?.goals ?? [],
      );
}
