// Flutter imports:
import 'package:flutter/widgets.dart';

// Project imports:
import '../../enums/enums.dart';
import '../../home/home.dart';
import '../../login/login.dart';
import '../../welcome/welcome.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [WelcomePage.page(), LoginPage.page()];
  }
}
