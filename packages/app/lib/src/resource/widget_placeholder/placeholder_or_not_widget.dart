import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';

class PlaceholderOrNotWidget extends StatelessWidget {
  const PlaceholderOrNotWidget({Key? key, required this.widget})
      : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder.responsiveWidget(
      mobile: widget,
      tablet: Container(),
      ultraTablet: Container(),
    );
  }
}
