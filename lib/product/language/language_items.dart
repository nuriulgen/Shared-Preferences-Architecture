class AppStringConstants {
  static AppStringConstants? _instance;
  static AppStringConstants? get instance {
    _instance ??= AppStringConstants._init();
    return _instance;
  }

  AppStringConstants._init();
  final String imagePath = 'sign_up_logo';
  final String title = 'Welcome Back';
  final String subTitle = 'Login to continue Radio App';
  final String hintText1 = 'Email Adress';
  final String hintText2 = 'Password';
  final String elevatedButtonText1 = 'Log In';
  final String elevatedButtonText2 = 'Continue with Google';
  final String elevatedButtonText3 = 'Continue with Facebook';
  final String textButtonTitle = 'Sign up';
  final String textTitle = 'Dont have an account';
  final String homeViewText = 'Username email adress:';
}
