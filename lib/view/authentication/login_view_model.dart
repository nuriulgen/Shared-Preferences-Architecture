import 'package:flutter/material.dart';

import '../../core/cache/shared_manager.dart';
import '../../product/color/color_items.dart';
import '../../product/language/language_items.dart';
import 'login_view.dart';

abstract class LoginViewModel extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AppStringConstants? appStringConstants = AppStringConstants.instance;
  ColorItems colorItems = ColorItems();
  bool isVisible = false;
  String email = '';
  String password = '';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late final SharedManager manager;

  @override
  void initState() {
    super.initState();
    manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    await manager.init();
    getDefaultValue();
  }

  Future<void> getDefaultValue() async {
    setState(() {
      email = manager.getStringValue(SharedManagerKeys.email) ?? '';
      password = manager.getStringValue(SharedManagerKeys.password) ?? '';
    });
  }

  void isChangeVisible() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
