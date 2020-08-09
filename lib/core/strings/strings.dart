// TODO: MOVE THIS TO LOCALIZATION
class Strings {

  static String getString(String key) => _strings[key];

  static const _strings = {
    "WelcomePage.Title": "Example App",
    "WelcomePage.StartHere": "Start Here",
    "WelcomePage.LoginButtonText": "Login",
    "WelcomePage.EmailLabel": "Email",
    "WelcomePage.EmailHint": "Your Email",
    "WelcomePage.PasswordLabel": "Password",
    "WelcomePage.PasswordHint": "Your Password",
    "WelcomePage.EmailError": "Wrong Email",
    "WelcomePage.PasswordError": "Password needs to be longer than 4 chars",
    "LoginFailedDialog.Title": "Login Failed",
    "LoginFailedDialog.DefaultMessage": "Wrong e-mail or password",
    "LoginSuccessDialog.Title": "Login Success",
    "LoginSuccessDialog.Message": "You've just got in",
    "LoadingDialog.Title": "Please Wait...",
    "Messages.OK": "OK",
    "Messages.DefaultApiError": "Something is wrong with your request",
    "FeatureNotAvailableDialog.Title": "Feature not available",
    "FeatureNotAvailableDialog.Message": "Sorry, Feature not available in this version.",
  };

}