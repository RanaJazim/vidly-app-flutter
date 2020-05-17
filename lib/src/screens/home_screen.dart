import 'package:flutter/material.dart';

import '../config/app_config.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConfig.title),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
    );
  }
}