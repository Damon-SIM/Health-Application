import 'package:TMW/pages/login/setting/get_start.dart';
import 'package:TMW/pages/login/setting/sex_selection.dart';
import 'package:TMW/pages/training/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:provider/provider.dart';
import 'home_structure.dart';
import 'loading.dart';
import 'package:TMW/pages/login/first_view.dart';
import 'package:TMW/pages/login/sign_up_view.dart';
import 'package:TMW/widgets/provider_widget.dart';
import 'package:TMW/services/auth_service.dart';
import 'package:TMW/services/training_notifier.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => TrainingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => BuildingNotifier(),
        ),
      ],
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider2(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "TMW",
        theme: mDefaultTheme,
        home: LoadingPage(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/start': (BuildContext context) => GetStart(),
          '/select': (BuildContext context) => SexSelectionPage(),
          '/home': (BuildContext context) => Wrapper(),
          "/map": (BuildContext context) => WebviewScaffold(
                url: "https://www.google.com/maps",
                appBar: AppBar(
                  title: Text('Map'),
                ),
              ),
        },
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider2.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        final bool signedIn = snapshot.hasData;
        return signedIn ? App() : FirstView();
      },
    );
  }
}

//
final ThemeData mDefaultTheme = ThemeData(
  primarySwatch: Colors.blue,
  // accentColor: Colors.lightBlue,
);
