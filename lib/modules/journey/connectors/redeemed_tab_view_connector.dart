import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:fello_hackathon/modules/journey/actions/journey_actions.dart';
import 'package:fello_hackathon/modules/journey/widgets/widgets/redeemed_tab_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class RedeemedTabViewConnector extends StatelessWidget {
  const RedeemedTabViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      onInit: ((store) {
        store.dispatch(
          GetRedeemedGoalsResponse(),
        );
      }),
      builder: (context, snapshot) {
        return RedeemedTabView(
          journeyRedeemedResponse: snapshot.journeyRedeemedResponse,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final List<GoalDetailsModel> journeyRedeemedResponse;

  _ViewModel({
    required this.journeyRedeemedResponse,
  }) : super(equals: [
          journeyRedeemedResponse,
        ]);
}

class _ViewModelFactory extends VmFactory<AppState, RedeemedTabViewConnector> {
  _ViewModelFactory(RedeemedTabViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        journeyRedeemedResponse:
            state.journeyState.redeemedGoalsResponse?.goals ?? [],
      );
}
