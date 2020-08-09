import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/ui/components/primary_button.dart';
import 'package:flutter_project_boilerplate/ui/components/text_field.dart';
import 'package:flutter_project_boilerplate/ui/components/white_button.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/login_page/di/login_page_graph.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/login_page/login_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget with InjectableWidget {
    final LoginPageGraph _graph;

    //injected
    ColorPalette colorPalette;
    //injected
    AppTextTheme textTheme;
    //injected
    LoginPageActionMapper actionMapper;

    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    @override
    LoginPageGraph graph() => _graph;

    LoginPage([graph]) : this._graph = graph ?? LoginPageGraph() {
        setup();
    }

    Widget topWidget(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                color: colorPalette.blue00,
                image: DecorationImage(
                    image: AssetImage(
                        "res/images/welcome_image.webp"
                    ),
                    fit: BoxFit.cover
                )
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(
                              Icons.arrow_back,
                              color: colorPalette.grey70,
                          ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 16),
                          child: Text(
                              "Login",
                              style: textTheme.heading2.copyWith(
                                  color: colorPalette.blue80
                              ),
                          ),
                        ),
                      ),
                    )
                ],
            ),
        );
    }

    Widget bottomWidget() {
        return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80)
                )
            ),
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16.0),
                      child: DefaultTextField(
                          controller: phoneController,
                          hintText: "Your Phone No.",
                          labelText: "Phone No.",
                          keyboardType: TextInputType.phone,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DefaultTextField(
                          controller: passwordController,
                          hintText: "Your Password",
                          labelText: "Password",
                          maxLines: 1,
                          obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: PrimaryButton(
                          textTheme: textTheme,
                          colorPalette: colorPalette,
                          onTap: () => actionMapper.submit(
                            phoneController.text, passwordController.text),
                          text: "Login",
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                      ),
                    ),
                    WhiteButton(
                        textTheme: textTheme,
                        colorPalette: colorPalette,
                        onTap: () => actionMapper.goToForgotPassword(),
                        textColor: colorPalette.primary,
                        text: "Forgot Password?",
                        padding: EdgeInsets.only(top: 16, bottom: 16),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                        color: colorPalette.grey05
                                    )
                                ),
                                margin: EdgeInsets.only(bottom: 16),
                                padding: EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 8,
                                    bottom: 8
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                        Text(
                                            "Didn't have an account yet?",
                                            style: textTheme.body,
                                        ),
                                        GestureDetector(
                                            onTap: () => actionMapper.goToRegister(),
                                            child: Text(
                                                "Register",
                                                style: textTheme.subheading2Bold.copyWith(
                                                    color: colorPalette.orange50
                                                ),
                                            ),
                                        )
                                    ],
                                ),
                            ),
                        ),
                    )
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
            color: colorPalette.blue00,
          child: SafeArea(
              child: Scaffold(
                body: Container(
                    color: Colors.white,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                          Flexible(
                              flex: 1,
                              child: topWidget(context)
                          ),
                          Flexible(
                              flex: 3,
                              child: bottomWidget()
                          ),
                      ],
                  ),
                ),
              ),
          ),
        );
    }
}
