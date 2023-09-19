import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todolist/screens/tabs_screen.dart';
import 'package:todolist/services/app_routes.dart';
import 'package:todolist/services/app_theme.dart';

import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  runApp(MyApp(
    appRoutes: AppRoutes(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRoutes});

  final AppRoutes appRoutes;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            title: 'To-Do List',
            home: TabsScreen(),
            onGenerateRoute: appRoutes.onGenerateRoute,
          );
        },
      ),
    );
  }
}
