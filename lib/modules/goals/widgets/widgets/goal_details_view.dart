import 'package:fello_hackathon/modules/goals/models/goal_details_model.dart';
import 'package:fello_hackathon/utilities/image_path_constants.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

class GoalDetailsView extends StatelessWidget {
  final GoalDetailsModel? selectedGoalDetails;
  final Function(String goalName, String goalAmount, String goalMonths)
      updateGoals;
  const GoalDetailsView(
      {Key? key, required this.selectedGoalDetails, required this.updateGoals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Here's your dream plan"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.all(
                  16.0,
                ),
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xFFD3E4F8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePathConstants.targetImage,
                        height: 240,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            selectedGoalDetails?.goalName ?? '',
                            style: TextStyle(
                                color: Color.fromARGB(255, 7, 48, 95),
                                fontSize: 24,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Rs. ${selectedGoalDetails?.goalAmount ?? ''}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              '${selectedGoalDetails?.goalMonths ?? ''} Months')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(16.0),
        child: SliderButton(
            buttonColor: Color(0xFF4CBF17),
            width: MediaQuery.of(context).size.width,
            action: () {
              updateGoals(
                selectedGoalDetails?.goalName ?? '',
                selectedGoalDetails?.goalAmount ?? '',
                selectedGoalDetails?.goalMonths ?? '',
              );
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            label: Text(
              "Slide to Confirm Goal",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: Icon(
              Icons.savings,
              color: Colors.white,
              size: 32,
            )),
      ),
    );
  }
}
