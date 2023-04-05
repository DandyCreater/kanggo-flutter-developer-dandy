import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanggo_flutter_developer_dandy/app/constanta_string.dart';
import 'package:kanggo_flutter_developer_dandy/app/injection_container.dart';
import 'package:kanggo_flutter_developer_dandy/app/routes.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/bloc/user-bloc/user_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final userBloc = sl<UserBloc>();
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => userBloc)],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashScreen,
        onGenerateRoute: Routes().onGenerateRoute,
      ),
    );
  }
}
