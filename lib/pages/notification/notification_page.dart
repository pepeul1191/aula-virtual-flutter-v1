import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notification_controller.dart';

class NotificationPage extends StatelessWidget {
  NotificationController control = Get.put(NotificationController());

  Widget _buildBody(BuildContext context) {
    return SafeArea(child: Text('Notification Page'));
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
