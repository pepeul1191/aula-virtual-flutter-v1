import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/usuario.dart';
import 'profile_controller.dart';

class ProfilePage extends StatelessWidget {
  final Usuario usuario;
  ProfileController control = Get.put(ProfileController());

  ProfilePage({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  Widget _buildBody(BuildContext context) {
    //return SafeArea(child: Text('Template Page + ${usuario.correo}'));
    return SafeArea(child: Text('Template Page + correo'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Center(
        child: _buildBody(context),
      ),
    );
  }
}
