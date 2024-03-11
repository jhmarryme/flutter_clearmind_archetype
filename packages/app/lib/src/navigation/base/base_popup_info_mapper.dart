import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:flutter/material.dart';

abstract class BasePopupInfoMapper {
  Widget map(AppPopupInfo appRouteInfo, AppNavigator navigator);
}
