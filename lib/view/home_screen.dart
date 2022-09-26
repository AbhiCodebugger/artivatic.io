import 'package:artivatic_assignment/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return controller.isLoading
              ? const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  backgroundColor: Colors.blueGrey[200],
                  appBar: AppBar(
                    backgroundColor: Colors.blueGrey[900],
                    title: Text(controller.list.title ?? ""),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: controller.searchController,
                          onChanged: (value) => controller.searchData(value),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Search',
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueGrey)),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  controller.searchController.text = '';
                                },
                              ),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: controller.onRefresh,
                            child: ListView.builder(
                                itemCount: controller.list.rows!.length,
                                itemBuilder: ((context, index) {
                                  return Card(
                                      elevation: 4.0,
                                      child: Row(
                                        children: [
                                          Flexible(
                                              flex: 1,
                                              child: controller
                                                          .list
                                                          .rows![index]
                                                          .imageHref ==
                                                      null
                                                  ? Image.asset(
                                                      'assets/placeholder.png')
                                                  : Image.network(
                                                      controller
                                                          .list
                                                          .rows![index]
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
                                                mainAxisSize: MainAxisSize.min,
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
                                                                FontWeight
                                                                    .bold),
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
                                })),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
