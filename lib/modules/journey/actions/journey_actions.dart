import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/mock_responses/journey.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/journey/model/journey_model.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class GetOngoingGoalsResponse extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    try {
      final response = JourneyResponse.fromJson(
        GetOngoingJourney.getGoalsResponse,
      );

      return state.copyWith(
        journeyState: state.journeyState.copyWith(
          ongoingGoalsResponse: response,
        ),
      );
    } catch (e) {
      debugPrint('goals response ${e.toString()}');
    }
  }
}

class GetRedeemedGoalsResponse extends ReduxAction<AppState> {
  @override
  Future<AppState?> reduce() async {
    try {
      final response = JourneyResponse.fromJson(
        GetRedeemedJourney.getGoalsResponse,
      );
      return state.copyWith(
        journeyState: state.journeyState.copyWith(
          redeemedGoalsResponse: response,
        ),
      );
    } catch (e) {
      debugPrint('goals response ${e.toString()}');
    }
  }
}

class UpdateOngoingJourneyAction extends ReduxAction<AppState> {
  final GoalDetailsModel request;
  UpdateOngoingJourneyAction({required this.request});
  @override
  Future<AppState?> reduce() async {
    try {} catch (e) {
      debugPrint('update journey ${e.toString()}');
    }
  }
}
