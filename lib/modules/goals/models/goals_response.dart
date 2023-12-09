class GoalsResponse {
  final List<Goals> goals;
  GoalsResponse({
    required this.goals,
  });
  factory GoalsResponse.init() {
    return GoalsResponse(
      goals: [],
    );
  }
  factory GoalsResponse.fromJson(Map<String, dynamic> json) {
    final goals = <Goals>[];
    if (json['goals'] != null) {
      json['goals'].forEach((v) {
        goals.add(Goals.fromJson(v));
      });
    }
    return GoalsResponse(
      goals: goals,
    );
  }
}

class Goals {
  final int goalId;
  final String goalName;
  final String goalImage;

  Goals({
    required this.goalId,
    required this.goalName,
    required this.goalImage,
  });

  factory Goals.fromJson(Map<String, dynamic> json) {
    final int goalId = json['goal_id'] ?? 0;
    final String goalName = json['goal_name'] ?? '';
    final String goalImage = json['goal_image'];
    return Goals(
      goalId: goalId,
      goalName: goalName,
      goalImage: goalImage,
    );
  }
}
