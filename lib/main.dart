import 'package:boos_job/page/home/home_page.dart';
import 'package:boos_job/routes/application.dart';
import 'package:boos_job/routes/routes.dart';
import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/home_page_provider.dart';

void main() {
  // 初始化路由
  var router = fluro.Router();
  Routes.configureRoutes(router);
  Application.router = router;  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
      ],
      child: MyApp(),
    )
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.white,
    statusBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        buttonTheme: ButtonThemeData(
          minWidth: 50,
          padding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 2
          )
        ),
        primaryColorLight: Colors.white,
        brightness: Brightness.light,
        primaryColor: Color(0xFF4faaa8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      onGenerateRoute: Application.router.generator,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh','CN'),
        const Locale('en','US'),
      ],
    );
  }
}

