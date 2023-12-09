import 'package:fello_hackathon/modules/journey/connectors/ongoing_tab_view_connector.dart';
import 'package:fello_hackathon/modules/journey/connectors/redeemed_tab_view_connector.dart';
import 'package:flutter/material.dart';

class JourneyView extends StatefulWidget {
  const JourneyView({Key? key}) : super(key: key);

  @override
  State<JourneyView> createState() => _JourneyViewState();
}

class _JourneyViewState extends State<JourneyView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(
                "Your Journey",
              ),
              centerTitle: true,
              pinned: true,
              floating: true,
              bottom: TabBar(
                  indicatorColor: Colors.black,
                  labelPadding: const EdgeInsets.only(
                    bottom: 16,
                  ),
                  controller: _tabController,
                  tabs: [
                    Text("Ongoing"),
                    Text("Redeemed"),
                  ]),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            OngoingTabViewConnector(),
            RedeemedTabViewConnector(),
          ],
        ),
      ),
    );
  }
}
