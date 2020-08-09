import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/ui/components/primary_button.dart';
import 'package:flutter_project_boilerplate/ui/components/text_field.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/forgot_password_page/di/forgot_password_page_graph.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/forgot_password_page/forgot_password_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

// ignore: must_be_immutable
class ForgotPasswordPage extends StatelessWidget with InjectableWidget {
    final ForgotPasswordPageGraph _graph;

    //injected
    ColorPalette colorPalette;
    //injected
    AppTextTheme textTheme;
    //injected
    ForgotPasswordPageActionMapper actionMapper;

    @override
    ForgotPasswordPageGraph graph() => _graph;

    ForgotPasswordPage([graph]) : this._graph = graph ?? ForgotPasswordPageGraph() {
        setup();
    }

    Widget topWidget(BuildContext context) {
        return Container(
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
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8, bottom: 6),
                        child: Text(
                            "Forgot password?",
                            style: textTheme.heading2,
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16.0, bottom: 16),
                        child: Text(
                            "Enter your account details to reset password",
                            style: textTheme.subheading1,
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 16.0, left: 16, right: 16),
                        child: DefaultTextField(
                            hintText: "Your Phone Number",
                            labelText: "Phone Number",

                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: PrimaryButton(
                          colorPalette: colorPalette,
                          textTheme: textTheme,
                          text: "Submit",
                          onTap: () => actionMapper.featureNotAvailable(),
                          padding: EdgeInsets.symmetric(vertical: 16),
                      ),
                    )
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                body: Container(
                    color: Colors.white,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            topWidget(context),
                        ],
                    ),
                ),
            ),
        );
    }
}
