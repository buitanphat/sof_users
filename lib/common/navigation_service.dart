import 'package:flutter/material.dart';
import 'package:sof_users/features/users/screens/sof_user_detail.dart';
import 'package:sof_users/features/users/screens/sof_user_list.dart';

class Routes {
  static const root = '/';
  static const userDetail = '/userDetail';

  Map<String, WidgetBuilder> mapping = {
    Routes.root: (context) => const SOFUsersScreen(),
    Routes.userDetail: (context) => const SOFUserDetailScreen(),
  };
}
