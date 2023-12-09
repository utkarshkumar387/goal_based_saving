import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';

class GoalsState {
  final GoalsResponse? goalsResponse;
  final GoalDetailsModel? goalDetails;

  const GoalsState({
    required this.goalsResponse,
    required this.goalDetails,
  });

  factory GoalsState.init() {
    return GoalsState(
      goalsResponse: GoalsResponse.init(),
      goalDetails: GoalDetailsModel.init(),
    );
  }

  GoalsState copyWith({
    GoalsResponse? goalsResponse,
    GoalDetailsModel? goalDetails,
  }) {
    return GoalsState(
      goalsResponse: goalsResponse ?? this.goalsResponse,
      goalDetails: goalDetails ?? this.goalDetails,
    );
  }
}
