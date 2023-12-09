import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/journey/widgets/journey_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class JourneyViewConnector extends StatelessWidget {
  const JourneyViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      builder: (context, snapshot) {
        return const JourneyView();
      },
    );
  }
}

class _ViewModel extends Vm {
  _ViewModel() : super();
}

class _ViewModelFactory extends VmFactory<AppState, JourneyViewConnector> {
  _ViewModelFactory(JourneyViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel();
}
