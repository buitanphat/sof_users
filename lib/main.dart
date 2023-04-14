import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sof_users/features/users/provider/sof_user_reputation_provider.dart';
import 'package:sof_users/features/users/provider/sof_users_provider.dart';

import 'common/navigation_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SOFUsersProvider>(
            create: (context) => SOFUsersProvider()),
        ChangeNotifierProvider<SOFUserReputationProvider>(
            create: (context) => SOFUserReputationProvider()),
      ],
      child: MaterialApp(
        initialRoute: Routes.root,
        routes: Routes().mapping,
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
