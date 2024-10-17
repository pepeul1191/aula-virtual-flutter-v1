import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calendar_controller.dart';

class CalendarPage extends StatelessWidget {
  CalendarController control = Get.put(CalendarController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(child: Text('Calendar Page'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: null,
            body: _buildBody(context)));
  }
}
