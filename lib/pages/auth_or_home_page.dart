import 'package:flutter/material.dart';
import 'package:loja/pages/auth_page.dart';
import 'package:loja/pages/products_overview_page.dart';
import 'package:provider/provider.dart';

import '../models/auth.dart';

class AuthOrHomePAge extends StatelessWidget {
  const AuthOrHomePAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);

    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return Center(
            child: Text('Ocorreu um erro!'),
          );
        } else {
          return auth.isAuth ? ProductsOverviewPage() : AuthPage();
        }
      },
    );
  }
}
