import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/ui/components/primary_button.dart';
import 'package:flutter_project_boilerplate/ui/components/text_field.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/register_page/di/register_page_graph.dart';
import 'package:flutter_project_boilerplate/ui/domain/auth/register_page/register_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget with InjectableWidget {
    final RegisterPageGraph _graph;

    //injected
    ColorPalette colorPalette;
    //injected
    AppTextTheme textTheme;
    //injected
    RegisterPageActionMapper actionMapper;

    @override
    RegisterPageGraph graph() => _graph;

    RegisterPage([graph]) : this._graph = graph ?? RegisterPageGraph() {
        setup();
    }

    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Widget topWidget(BuildContext context) {
        return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("res/images/welcome_image.webp"),
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
                                color: colorPalette.black,
                            ),
                        ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                                padding: const EdgeInsets.only(left: 16.0, top: 24, bottom: 16),
                                child: Text(
                                    "Register",
                                    style: textTheme.heading2.copyWith(
                                        color: colorPalette.black
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
            child: ListView(
                children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 8.0),
                        child: DefaultTextField(
                            controller: nameController,
                            hintText: "Your Name",
                            labelText: "Name",
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DefaultTextField(
                            controller: phoneController,
                            hintText: "Your phone number",
                            labelText: "Phone No.",
                            keyboardType: TextInputType.phone,
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DefaultTextField(
                            controller: emailController,
                            hintText: "Email",
                            labelText: "Email",
                            keyboardType: TextInputType.emailAddress,
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: DefaultTextField(
                            controller: passwordController,
                            hintText: "Password",
                            labelText: "Password",
                            obscureText: true,
                            maxLines: 1,
                        ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                        child: PrimaryButton(
                            textTheme: textTheme,
                            colorPalette: colorPalette,
                            onTap: () => actionMapper.submitRegister(
                                phoneNumber: phoneController.text,
                                password: passwordController.text,
                                name: nameController.text,
                                email: emailController.text
                            ),
                            text: "Register",
                            padding: EdgeInsets.only(top: 16, bottom: 16),
                        ),
                    ),
                ],
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return Container(
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
