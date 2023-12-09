import 'package:fello_hackathon/modules/models/loading_status.dart';
import 'package:fello_hackathon/redux/states/goals_state.dart';
import 'package:fello_hackathon/redux/states/journey_state.dart';
import 'package:flutter/material.dart';

@immutable
class AppState {
  final GoalsState goalsState;
  final JourneyState journeyState;
  final bool isLoading;

  const AppState({
    required this.goalsState,
    required this.journeyState,
    required this.isLoading,
  });

  factory AppState.init() {
    return AppState(
        goalsState: GoalsState.init(),
        journeyState: JourneyState.init(),
        isLoading: true);
  }

  AppState copyWith({
    GoalsState? goalsState,
    JourneyState? journeyState,
    bool? isLoading,
  }) {
    return AppState(
        goalsState: goalsState ?? this.goalsState,
        journeyState: journeyState ?? this.journeyState,
        isLoading: isLoading ?? this.isLoading);
  }
}
