import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/actions/goals_actions.dart';
import 'package:fello_hackathon/modules/goals/connectors/create_goal_form_view_connector.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:fello_hackathon/modules/goals/widgets/goals_view.dart';
import 'package:fello_hackathon/modules/journey/widgets/widgets/custom_circular_progress_indicator.dart';
import 'package:fello_hackathon/modules/models/loading_status.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class GoalsViewConnector extends StatelessWidget {
  const GoalsViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      onInit: ((store) {
        store.dispatch(
          GetGoalsResponse(),
        );
      }),
      builder: (context, snapshot) {
        return GoalsView(
          goalsResponse: snapshot.goalsResponse,
          navigateToCreateGoalView: snapshot.navigateToCreateGoalView,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final GoalsResponse? goalsResponse;
  final Function(BuildContext) navigateToCreateGoalView;

  _ViewModel({
    required this.goalsResponse,
    required this.navigateToCreateGoalView,
  }) : super(equals: [
          goalsResponse,
        ]);
}

class _ViewModelFactory extends VmFactory<AppState, GoalsViewConnector> {
  _ViewModelFactory(GoalsViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        goalsResponse: state.goalsState.goalsResponse,
        navigateToCreateGoalView: (BuildContext context) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateGoalFormViewConnector(),
          ),
        ),
      );
}
