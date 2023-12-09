import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/journey/actions/journey_actions.dart';
import 'package:fello_hackathon/modules/journey/model/journey_model.dart';
import 'package:fello_hackathon/modules/journey/widgets/widgets/update_ongoing_journey_dialog.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/cupertino.dart';

class RedeemedTabViewConnector extends StatelessWidget {
  const RedeemedTabViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      onInit: ((store) {}),
      builder: (context, snapshot) {
        return UpdateOngoingJourneyDialog(
            // updateJourney: snapshot.updateJourney,
            );
      },
    );
  }
}

class _ViewModel extends Vm {
  final Function(String, String, String) updateJourney;
  _ViewModel({
    required this.updateJourney,
  }) : super();
}

class _ViewModelFactory extends VmFactory<AppState, RedeemedTabViewConnector> {
  _ViewModelFactory(RedeemedTabViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        updateJourney: (String goalName, String goalAmount, String goalMonths) {
          final GoalDetailsModel request = GoalDetailsModel(
              goalName: goalName,
              goalAmount: goalAmount,
              goalMonths: goalMonths);
          dispatch(
            UpdateOngoingJourneyAction(
              request: request,
            ),
          );
        },
      );
}
