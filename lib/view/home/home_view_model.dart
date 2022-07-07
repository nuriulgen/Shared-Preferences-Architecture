import 'package:flutter/material.dart';

import '../../core/cache/shared_manager.dart';
import 'home_view.dart';

abstract class HomeViewModel extends State<HomeView> {
  String email = ' ';
  late final SharedManager manager;

  @override
  void initState() {
    super.initState();
    manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    await manager.init();
    _loadEmail();
  }

  _loadEmail() async {
    setState(() {
      email = (manager.getStringValue(SharedManagerKeys.email) ?? '');
    });
  }
}
