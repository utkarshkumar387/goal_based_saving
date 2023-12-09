import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/actions/goals_actions.dart';
import 'package:fello_hackathon/modules/goals/connectors/goal_details_view_connector.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:fello_hackathon/modules/goals/widgets/widgets/create_goal_form_view.dart';
import 'package:fello_hackathon/modules/goals/widgets/widgets/goal_details_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GoalDetailsViewConnector extends StatelessWidget {
  const GoalDetailsViewConnector({Key? key}) : super(key: key);

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
        return GoalDetailsView(
          selectedGoalDetails: snapshot.selectedGoalDetails,
          updateGoals: snapshot.updateGoals,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final Function(BuildContext) navigateToGoalDetailsScreen;
  final GoalDetailsModel? selectedGoalDetails;
  final Function(
    String,
    String,
    String,
  ) updateGoals;
  _ViewModel({
    required this.navigateToGoalDetailsScreen,
    required this.selectedGoalDetails,
    required this.updateGoals,
  }) : super();
}

class _ViewModelFactory extends VmFactory<AppState, GoalDetailsViewConnector> {
  _ViewModelFactory(GoalDetailsViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
        navigateToGoalDetailsScreen: (BuildContext context) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const GoalDetailsViewConnector(),
          ),
        ),
        selectedGoalDetails: state.goalsState.goalDetails,
        updateGoals: (String goalName, String goalAmount, String goalMonths) {
          final GoalDetailsModel goal = GoalDetailsModel(
              goalName: goalName,
              goalAmount: goalAmount,
              goalMonths: goalMonths);
          dispatch(UpdateGoalAction(goalDetails: goal));
          Fluttertoast.showToast(msg: "Check your added goal in journey");
        },
      );
}
