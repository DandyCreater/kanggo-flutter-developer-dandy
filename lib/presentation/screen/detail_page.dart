import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kanggo_flutter_developer_dandy/data/model/list_user_response_model.dart';

class DetailPage extends StatelessWidget {
  final DetailPageArguments arguments;
  const DetailPage({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(arguments.imageUrl!),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.42, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      arguments.name!,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(Icons.mail),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      arguments.email!,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
