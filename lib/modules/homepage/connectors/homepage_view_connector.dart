import 'package:async_redux/async_redux.dart';
import 'package:fello_hackathon/modules/homepage/widgets/homepage_view.dart';
import 'package:fello_hackathon/redux/states/app_state.dart';
import 'package:flutter/material.dart';

class HomepageViewConnector extends StatelessWidget {
  const HomepageViewConnector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      builder: (context, snapshot) {
        return const HomepageView();
      },
    );
  }
}

class _ViewModel extends Vm {
  _ViewModel() : super();
}

class _ViewModelFactory extends VmFactory<AppState, HomepageViewConnector> {
  _ViewModelFactory(HomepageViewConnector widget) : super(widget);

  @override
  _ViewModel fromStore() => _ViewModel();
}
