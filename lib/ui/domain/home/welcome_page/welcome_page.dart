import 'package:flutter/material.dart';
import 'package:flutter_project_boilerplate/core/di/injectable_widget.dart';
import 'package:flutter_project_boilerplate/ui/components/primary_button.dart';
import 'package:flutter_project_boilerplate/ui/components/white_button.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/di/welcome_page_graph.dart';
import 'package:flutter_project_boilerplate/ui/domain/home/welcome_page/welcome_page_action_mapper.dart';
import 'package:flutter_project_boilerplate/ui/utils/app_text_theme.dart';
import 'package:flutter_project_boilerplate/ui/utils/color_palette.dart';

// ignore: must_be_immutable
class WelcomePage extends StatefulWidget with InjectableWidget {
    final WelcomePageGraph _graph;

    //injected
    ColorPalette colorPalette;

    //injected
    AppTextTheme textTheme;

    WelcomePageActionMapper actionMapper;
    
    WelcomePage([graph]) : this._graph = graph ?? WelcomePageGraph() {
        setup();
    }

    @override
    WelcomePageGraph graph() => _graph;

      @override
      _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

    Widget mainContent(BuildContext context) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image(
                        image: AssetImage("res/images/welcome_image.webp"),
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                      child: bottomSection())
                ],
            ),
            Positioned(
              right: 8,
              top: 8,
              width: 140,
              child: WhiteButton(
                colorPalette: widget.colorPalette,
                textTheme: widget.textTheme,
                text: "Login/Register",
                onTap: () {
                  widget.actionMapper.goToLogin();
                },
              ),
            ),
          ],
        );
    }

    Widget bottomSection() {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Text(
                        "Title",
                        style: widget.textTheme.heading3,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                          "Subtitle",
                          style: widget.textTheme.subheading1.copyWith(
                              color: Color(0xFF83817C)
                          ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Center(
                        child: Text(
                          "Welcome to app!"
                        ),
                      )
                  )
              ],
          ),
        );
    }

    Widget valueItem(String imageRes, String title) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                    color: widget.colorPalette.orange00,
                    borderRadius: BorderRadius.circular(48)
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Image(
                    image: AssetImage(imageRes),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: widget.textTheme.body.copyWith(
                    color: Color(0xFF353331)
                ),
              ),
            )
          ],
        ),
      );
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: SafeArea(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  color: widget.colorPalette.white,
                  child: mainContent(context),
              ),
            ),
        );
    }
}
