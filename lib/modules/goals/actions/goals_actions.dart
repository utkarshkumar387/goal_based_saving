import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/mock_responses/goals.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetGoalsResponse extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    try {
      final response = GoalsResponse.fromJson(
        GetGoals.getGoalsResponse,
      );

      return state.copyWith(
        goalsState: state.goalsState.copyWith(
          goalsResponse: response,
        ),
      );
    } catch (e) {
      debugPrint('goals response ${e.toString()}');
    }
  }

  // @override
  // void before() => dispatch(UpdateLoadingStatus(true));

  // @override
  // void after() => dispatch(UpdateLoadingStatus(false));
}

class SaveGoalDetails extends ReduxAction<AppState> {
  final GoalDetailsModel goalDetails;
  SaveGoalDetails({
    required this.goalDetails,
  });
  @override
  Future<AppState?> reduce() async {
    try {
      return state.copyWith(
        goalsState: state.goalsState.copyWith(
          goalDetails: goalDetails,
        ),
      );
    } catch (e) {
      debugPrint('goal detaisl ${e.toString()}');
    }
  }
}

class UpdateGoalAction extends ReduxAction<AppState> {
  final GoalDetailsModel goalDetails;
  UpdateGoalAction({
    required this.goalDetails,
  });

  @override
  Future<AppState?> reduce() async {
    try {
      Fluttertoast.showToast(msg: "Check your added goal in journey");
      return state.copyWith(
        journeyState: state.journeyState.copyWith(
            ongoingGoalsResponse:
                state.journeyState.ongoingGoalsResponse?.copyWith(
          goals: [
            ...state.journeyState.ongoingGoalsResponse?.goals ?? [],
            goalDetails
          ],
        )),
      );
    } catch (e) {
      debugPrint('update goal ${e.toString()}');
    }
  }
}

// class UpdateLoadingStatus extends ReduxAction<AppState> {
//   final bool isLoading;

//   UpdateLoadingStatus(this.isLoading);

//   @override
//   AppState reduce() {
//     return state.copyWith(
//       isLoading: isLoading,
//     );
//   }
// }
