import 'package:flutter_modular/flutter_modular.dart';
import 'package:practice/presentation/pages/authentification.dart';
import 'package:practice/presentation/pages/home_page.dart';
import 'package:practice/presentation/pages/signin_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/signin_page', child: (context, args) => SignInPage()),
        ChildRoute('/login_page', child: (context, args) => AuthPage()),
      ];
}

// TODO route for film page
