import 'package:flutter/material.dart';

class InsightTab extends StatefulWidget {
  const InsightTab({Key? key}) : super(key: key);

  @override
  _InsightTabState createState() => _InsightTabState();
}

class _InsightTabState extends State<InsightTab> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Insight Tab'),
      ),
    );
  }
}
