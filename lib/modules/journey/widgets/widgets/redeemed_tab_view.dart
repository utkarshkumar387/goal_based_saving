import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:flutter/material.dart';

class RedeemedTabView extends StatelessWidget {
  final List<GoalDetailsModel> journeyRedeemedResponse;
  const RedeemedTabView({Key? key, required this.journeyRedeemedResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: journeyRedeemedResponse.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            separatorBuilder: (context, index) => const SizedBox(height: 15),
            itemBuilder: (context, index) {
              return Material(
                type: MaterialType.transparency,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFB8F9E4),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    child: Column(
                      children: [
                        Text(journeyRedeemedResponse[index].goalName),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
