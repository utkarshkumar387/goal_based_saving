import 'package:fello_hackathon/modules/goals/models/goals_response.dart';
import 'package:flutter/material.dart';

class GoalsView extends StatelessWidget {
  final GoalsResponse? goalsResponse;
  final Function(BuildContext context) navigateToCreateGoalView;
  const GoalsView({
    Key? key,
    required this.goalsResponse,
    required this.navigateToCreateGoalView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverLayoutBuilder(
                builder: (BuildContext context, constraints) {
                  return const SliverAppBar(
                    pinned: true,
                    backgroundColor: Colors.white,
                    elevation: 2,
                    title: const Text(
                      'Goals',
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    centerTitle: false,
                  );
                },
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200.0,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 1.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          navigateToCreateGoalView(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.only(top: 16),
                          decoration: ShapeDecoration(
                            color: Color(0xFFF8DFD9),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              Image.asset(
                                goalsResponse?.goals[index].goalImage ?? '',
                                height: 120,
                                width: 140,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                goalsResponse?.goals[index].goalName ?? '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3C3838),
                                  fontSize: 16,
                                  fontFamily: 'Advent Pro',
                                  fontWeight: FontWeight.w700,
                                  height: 0.06,
                                  letterSpacing: -0.64,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: goalsResponse?.goals.length,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
