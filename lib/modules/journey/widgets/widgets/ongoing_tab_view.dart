import 'package:fello_hackathon/modules/goals/connectors/create_goal_form_view_connector.dart';
import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:flutter/material.dart';

class OngoingTabView extends StatelessWidget {
  final List<GoalDetailsModel> journeyOngoingResponse;
  const OngoingTabView({
    Key? key,
    required this.journeyOngoingResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: journeyOngoingResponse.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15),
                itemBuilder: (context, index) {
                  return Material(
                    type: MaterialType.transparency,
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF8DFD9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Text(journeyOngoingResponse[index].goalName),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateGoalFormViewConnector(),
                  ),
                );
              }),
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xFFF8DFD9), width: 2.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Text('Create Your own Goal'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
