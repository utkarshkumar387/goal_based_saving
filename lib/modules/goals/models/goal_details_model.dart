class GoalDetailsModel {
  final String goalName;
  final String goalAmount;
  final String goalMonths;

  GoalDetailsModel({
    required this.goalName,
    required this.goalAmount,
    required this.goalMonths,
  });

  factory GoalDetailsModel.init() {
    return GoalDetailsModel(
      goalName: '',
      goalAmount: '',
      goalMonths: '',
    );
  }

  factory GoalDetailsModel.fromJson(Map<String, dynamic> json) {
    final String goalName = json['goal_name'] ?? '';
    final String goalAmount = json['goal_amount'] ?? '';
    final String goalMonths = json['goal_months'];
    return GoalDetailsModel(
      goalName: goalName,
      goalAmount: goalAmount,
      goalMonths: goalMonths,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['goal_name'] = goalName;
    data['goal_amount'] = goalAmount;
    data['goal_months'] = goalMonths;
    return data;
  }
}
