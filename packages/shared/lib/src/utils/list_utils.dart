import 'package:flutter/material.dart';

extension WidgetListExtensions on List<Widget> {
  /// 添加 [separatorWidget] 作为分隔器小部件，用于在列表中的每个小部件之间。
  ///
  /// 返回一个新的列表，在小部件之间添加了分隔器。
  List<Widget> separatedWithWidget(Widget separatorWidget) {
    return [
      for (int i = 0; i < length; i++) ...[
        this[i],
        if (i < length - 1) separatorWidget,
      ],
    ];
  }
}
