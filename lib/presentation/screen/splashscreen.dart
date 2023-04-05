import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kanggo_flutter_developer_dandy/app/constanta_string.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/bloc/user-bloc/user_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<UserBloc>().add(const FetchUser(index: 1));
    Future.delayed(const Duration(seconds: 10))
        .then((value) => Navigator.pushNamed(context, homepage));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Lottie.network(
            "https://assets2.lottiefiles.com/packages/lf20_Z5qhQy.json",
            fit: BoxFit.cover),
      ),
    );
  }
}
