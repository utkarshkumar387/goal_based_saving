import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';

class JourneyResponse {
  final List<GoalDetailsModel> goals;
  JourneyResponse({
    required this.goals,
  });
  factory JourneyResponse.init() {
    return JourneyResponse(
      goals: [],
    );
  }
  JourneyResponse copyWith({
    final List<GoalDetailsModel>? goals,
  }) {
    return JourneyResponse(
      goals: goals ?? this.goals,
    );
  }

  factory JourneyResponse.fromJson(Map<String, dynamic> json) {
    final goals = <GoalDetailsModel>[];
    if (json['goals'] != null) {
      json['goals'].forEach((v) {
        goals.add(GoalDetailsModel.fromJson(v));
      });
    }
    return JourneyResponse(
      goals: goals,
    );
  }
}
