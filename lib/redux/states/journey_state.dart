import 'package:fello_hackathon/modules/journey/model/journey_model.dart';

class JourneyState {
  final JourneyResponse? ongoingGoalsResponse;
  final JourneyResponse? redeemedGoalsResponse;

  const JourneyState({
    required this.ongoingGoalsResponse,
    required this.redeemedGoalsResponse,
  });

  factory JourneyState.init() {
    return JourneyState(
      ongoingGoalsResponse: JourneyResponse.init(),
      redeemedGoalsResponse: JourneyResponse.init(),
    );
  }

  JourneyState copyWith({
    JourneyResponse? ongoingGoalsResponse,
    JourneyResponse? redeemedGoalsResponse,
  }) {
    return JourneyState(
      ongoingGoalsResponse: ongoingGoalsResponse ?? this.ongoingGoalsResponse,
      redeemedGoalsResponse:
          redeemedGoalsResponse ?? this.redeemedGoalsResponse,
    );
  }
}
