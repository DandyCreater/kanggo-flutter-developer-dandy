import 'package:flutter/material.dart';
import 'package:kanggo_flutter_developer_dandy/app/constanta_string.dart';
import 'package:kanggo_flutter_developer_dandy/data/model/list_user_response_model.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/screen/detail_page.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/screen/homepage.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/screen/splashscreen.dart';

class Routes {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case homepage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case detailScreen:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => DetailPage(
                  arguments: settings.arguments as DetailPageArguments,
                ));
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              leading: InkWell(
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Container(
              color: Colors.white,
              child: const Center(
                child: Text("Halaman Sedang Dalam Pengerjaan"),
              ),
            ),
          ),
        );
    }
  }
}
