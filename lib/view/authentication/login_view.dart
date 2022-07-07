import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_flutter/core/cache/shared_manager.dart';
import 'package:shared_flutter/core/components/button/custom_elevated_button.dart';
import 'package:shared_flutter/core/constants/image/image_constants.dart';
import 'package:shared_flutter/core/extension/context_extension.dart';
import 'package:shared_flutter/core/extension/size_extenison.dart';
import 'package:shared_flutter/view/home/home_view.dart';

import '../../core/components/widget/custom_rich_text.dart';
import '../../core/components/widget/custom_text_field.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends LoginViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: context.padding2xHorizontal,
          child: Column(
            children: [
              Padding(padding: context.paddingXVertical, child: pngImage()),
              _titleWidget(context),
              SizedBox(height: context.normalValue),
              _subTitleWidget(context),
              _formFieldWidget(context),
              Padding(
                padding: context.padding2xVertical,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomElevatedButton(
                    onPressed: () async {
                      await saveValue();
                      validateLogin(context);
                    },
                    title: appStringConstants!.elevatedButtonText1,
                    color: colorItems.buttonColor,
                    textColor: colorItems.whiteColor,
                  ),
                ),
              ),
              Padding(
                padding: context.paddingXVertical,
                child: _googleButton(context),
              ),
              Padding(
                padding: context.paddingXVertical,
                child: _facebookButton(context),
              ),
              SizedBox(height: context.normalValue),
              _richTextWithButton(),
            ],
          ),
        ),
      ),
    );
  }

  CustomRichText _richTextWithButton() {
    return CustomRichText(
      buttonTitle: appStringConstants!.textButtonTitle,
      title: appStringConstants!.textTitle,
    );
  }

  SizedBox _facebookButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomElevatedButton(
        title: appStringConstants!.elevatedButtonText3,
        color: colorItems.facebookButtonColor,
        textColor: colorItems.whiteColor,
        onPressed: () {},
      ),
    );
  }

  SizedBox _googleButton(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomElevatedButton(
        title: appStringConstants!.elevatedButtonText2,
        color: colorItems.whiteColor,
        textColor: colorItems.blackColor,
        onPressed: () {},
      ),
    );
  }

  void validateLogin(BuildContext context) {
    if (formKey.currentState?.validate() ?? false) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const HomeView(),
          ));
    } else {
      if (kDebugMode) {
        print('Giriş Başarısız');
      }
    }
  }

  Form _formFieldWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: context.padding2xVertical,
            child: _emailTextField(),
          ),
          _passwordTextField(),
        ],
      ),
    );
  }

  CustomTextField _passwordTextField() {
    return CustomTextField(
      controller: passwordController,
      prefixIcon: Icon(Icons.lock_outline, color: colorItems.inputColor),
      hintText: appStringConstants!.hintText2,
      obscureText: isVisible,
      suffixIcon: onVisibilityChangedButton(),
    );
  }

  CustomTextField _emailTextField() {
    return CustomTextField(
      controller: emailController,
      prefixIcon: Icon(
        Icons.mail_outline_outlined,
        color: colorItems.inputColor,
      ),
      hintText: appStringConstants!.hintText1,
      obscureText: false,
    );
  }

  Text _subTitleWidget(BuildContext context) {
    return Text(
      appStringConstants!.subTitle,
      style: Theme.of(context)
          .textTheme
          .subtitle2
          ?.copyWith(color: colorItems.textColor),
    );
  }

  Text _titleWidget(BuildContext context) {
    return Text(
      appStringConstants!.title,
      style: Theme.of(context).textTheme.headline6?.copyWith(
            color: colorItems.whiteColor,
          ),
    );
  }

  PngImage pngImage() => PngImage(name: appStringConstants!.imagePath);

  Future<void> saveValue() async {
    await manager.saveStringValue(
      SharedManagerKeys.email,
      emailController.text.toString(),
    );
    await manager.saveStringValue(
      SharedManagerKeys.password,
      passwordController.text.toString(),
    );
  }

  IconButton onVisibilityChangedButton() {
    return IconButton(
      icon: AnimatedCrossFade(
        firstChild: Icon(
          Icons.visibility_outlined,
          color: colorItems.inputColor,
        ),
        secondChild: Icon(
          Icons.visibility_off_outlined,
          color: colorItems.inputColor,
        ),
        crossFadeState:
            isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: DurationsItems._durationLow,
      ),
      onPressed: () {
        isChangeVisible();
      },
    );
  }
}

class DurationsItems {
  static const _durationLow = Duration(seconds: 1);
}
