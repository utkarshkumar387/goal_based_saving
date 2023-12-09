import 'package:flutter/material.dart';

class CreateGoalFormView extends StatefulWidget {
  final Function(BuildContext context) navigateToGoalDetailsScreen;
  final Function(String goalName, String goalAmount, String goalMonths)
      saveGoalDetails;
  const CreateGoalFormView({
    Key? key,
    required this.navigateToGoalDetailsScreen,
    required this.saveGoalDetails,
  }) : super(key: key);

  @override
  State<CreateGoalFormView> createState() => _CreateGoalFormViewState();
}

class _CreateGoalFormViewState extends State<CreateGoalFormView> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _goalName = TextEditingController();
  final TextEditingController _goalAmount = TextEditingController();
  final TextEditingController _goalMonths = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Create your goal',
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      body: Form(
        key: _formKey,
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            setState(() {
              if (_currentStep < 2) {
                _currentStep++;
              } else {
                widget.saveGoalDetails(
                  _goalName.text,
                  _goalAmount.text,
                  _goalMonths.text,
                );
                widget.navigateToGoalDetailsScreen(context);
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (_currentStep > 0) {
                _currentStep--;
              } else {
                // Go back to previous screen
              }
            });
          },
          steps: [
            Step(
              title: Text("Let's give your goal a name"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Goal Name',
                            style: TextStyle(
                              color: Color(0xFF002355),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF80B3FF)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _goalName,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Goal name',
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Text('Please enter goal amount'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Goal Amount',
                            style: TextStyle(
                              color: Color(0xFF002355),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF80B3FF)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _goalAmount,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Goal Amount',
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Step(
              title: Text("How long would you like to invest for your goal?"),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Months',
                            style: TextStyle(
                              color: Color(0xFF002355),
                              fontSize: 16,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF80B3FF)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: _goalMonths,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Months',
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
