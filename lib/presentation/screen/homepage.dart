import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:kanggo_flutter_developer_dandy/app/constanta_string.dart';
import 'package:kanggo_flutter_developer_dandy/data/model/list_user_response_model.dart';
import 'package:kanggo_flutter_developer_dandy/presentation/bloc/user-bloc/user_bloc.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ListDropdown> dropdown = [
    const ListDropdown(id: 1, pageName: "Page 1"),
    const ListDropdown(id: 2, pageName: "Page 2"),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Lottie.network(
                      "https://assets2.lottiefiles.com/packages/lf20_bo8vqwyw.json"),
                ),
                const Text(
                  "User List Data",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField2(
                  hint: Text(dropdown.first.pageName),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(4, 10, 18, 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  items: dropdown
                      .map((item) => DropdownMenuItem(
                          value: item, child: Text(item.pageName)))
                      .toList(),
                  isExpanded: true,
                  dropdownStyleData: const DropdownStyleData(
                    isOverButton: false,
                    maxHeight: 200,
                  ),
                  onChanged: (value) {
                    context.read<UserBloc>().add(FetchUser(index: value!.id));
                  },
                  onSaved: (value) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: height * 0.65,
                  child: BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserSuccess) {
                        var items = state.value!.data;
                        return AlignedGridView.count(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            physics: const BouncingScrollPhysics(),
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                            itemCount: items!.length,
                            itemBuilder: ((context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, detailScreen,
                                      arguments: DetailPageArguments(
                                          email: items[index].email,
                                          imageUrl: items[index].avatar,
                                          name:
                                              "${items[index].firstName} ${items[index].lastName}"));
                                },
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 10,
                                          spreadRadius: 1,
                                          offset: const Offset(0, 2),
                                          color: Colors.black.withOpacity(0.2))
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10),
                                                      topRight:
                                                          Radius.circular(10)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      items[index].avatar!),
                                                  fit: BoxFit.cover)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${items[index].firstName!} ${items[index].lastName!}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                items[index].email!,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              );
                            }));
                      }
                      return Center(
                        child: SizedBox(
                          height: 400,
                          width: 400,
                          child: Lottie.network(
                              "https://assets9.lottiefiles.com/packages/lf20_p8bfn5to.json",
                              height: 300,
                              width: 300),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: Lottie.network(
                          "https://assets6.lottiefiles.com/private_files/lf30_dUMbpm.json",
                          fit: BoxFit.cover),
                    ),
                  );
                });
            Future.delayed(const Duration(seconds: 2))
                .then((value) => Navigator.pop(context));
          },
          child: SizedBox(
            height: 100,
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Lottie.network(
                          "https://assets2.lottiefiles.com/packages/lf20_uhsngkt4.json"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -30,
                      child: SizedBox(
                        height: 100,
                        width: 50,
                        child: Lottie.network(
                            "https://assets8.lottiefiles.com/packages/lf20_yrruhev9.json"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListDropdown {
  final int? id;
  final String pageName;

  const ListDropdown({required this.id, required this.pageName});
}
