import 'package:artivatic_assignment/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text(controller.list.title ?? ""),
                  ),
                  body: controller.list.rows!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.list.rows!.length,
                          itemBuilder: ((context, index) {
                            return controller.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Card(
                                    elevation: 4.0,
                                    margin: const EdgeInsets.all(6),
                                    child: Row(
                                      children: [
                                        Flexible(
                                            flex: 1,
                                            child: controller.list.rows![index]
                                                        .imageHref ==
                                                    null
                                                ? Image.asset(
                                                    'assets/placeholder.png')
                                                : Image.network(
                                                    controller.list.rows![index]
                                                        .imageHref!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                          'assets/placeholder.png');
                                                    },
                                                  )),
                                        const SizedBox(width: 6),
                                        Flexible(
                                            flex: 2,
                                            fit: FlexFit.loose,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.list.rows![index]
                                                          .title ??
                                                      "-",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                                Text(controller
                                                        .list
                                                        .rows![index]
                                                        .description ??
                                                    "-"),
                                              ],
                                            ))
                                      ],
                                    ));
                          })));
        });
  }
}
