import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/goals/actions/goals_actions.dart';
import 'package:fello_hackathon/modules/goals/connectors/goal_details_view_connector.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/widgets/widgets/create_goal_form_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class CreateGoalFormViewConnector extends StatelessWidget {
  const CreateGoalFormViewConnector({Key? key}) : super(key: key);

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
        return CreateGoalFormView(
          navigateToGoalDetailsScreen: snapshot.navigateToGoalDetailsScreen,
          saveGoalDetails: snapshot.saveGoalDetails,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final Function(BuildContext) navigateToGoalDetailsScreen;
  final Function(String, String, String) saveGoalDetails;
  _ViewModel({
    required this.navigateToGoalDetailsScreen,
    required this.saveGoalDetails,
  }) : super();
}

class _ViewModelFactory
    extends VmFactory<AppState, CreateGoalFormViewConnector> {
  _ViewModelFactory(CreateGoalFormViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel(
      navigateToGoalDetailsScreen: (BuildContext context) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const GoalDetailsViewConnector(),
            ),
          ),
      saveGoalDetails: (String goalName, String goalAmount, String goalMonths) {
        final GoalDetailsModel goalDetails = GoalDetailsModel(
          goalName: goalName,
          goalAmount: goalAmount,
          goalMonths: goalMonths,
        );
        dispatch(
          SaveGoalDetails(
            goalDetails: goalDetails,
          ),
        );
      });
}
