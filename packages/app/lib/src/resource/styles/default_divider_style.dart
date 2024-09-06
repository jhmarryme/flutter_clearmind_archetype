import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_app/app.dart';

class DefaultDividerStyle {
  DefaultDividerStyle._();

  ///分割线 0.5 - 20边距
  static Widget divider1HalfPadding20 = Divider(
    height: 0.5,
    thickness: 0.5,
    indent: 20,
    endIndent: 20,
    color: AppColors.current.secondaryTextColor,
  );

  ///分割线 0.5 - 无边距
  static Widget divider1Half = Divider(
    height: 0.5,
    thickness: 0.5,
    color: AppColors.current.secondaryTextColor,
  );

  ///分割线 20 - 无边距
  static Widget divider20Half = Divider(
    height: 20,
    thickness: 20,
    color: AppColors.current.secondaryTextColor,
  );
}
