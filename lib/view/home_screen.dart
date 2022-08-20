import 'package:artivatic_assignment/controller/home_controller.dart';
import 'package:artivatic_assignment/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  Future onRefresh() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    setState(() {
      debugPrint('refresh');
    });
  }

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
                    // actions: [
                    //   IconButton(
                    //     onPressed: () {
                    //       showSearch(context: context, delegate: SearchView());
                    //     },
                    //     icon: const Icon(Icons.search),
                    //   ),
                    // ],
                  ),
                  body: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (value) => controller.searchData(value),
                          decoration: InputDecoration(
                              hintText: 'Search',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  controller.searchController.text = '';
                                },
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      controller.list.rows!.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Expanded(
                              child: RefreshIndicator(
                                onRefresh: onRefresh,
                                child: ListView.builder(
                                    itemCount: controller.list.rows!.length,
                                    itemBuilder: ((context, index) {
                                      return controller.isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : Card(
                                              elevation: 4.0,
                                              margin: const EdgeInsets.all(6),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
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
                                                              errorBuilder:
                                                                  (context,
                                                                      error,
                                                                      stackTrace) {
                                                                return Image.asset(
                                                                    'assets/placeholder.png');
                                                              },
                                                            )),
                                                  const SizedBox(width: 6),
                                                  Flexible(
                                                      flex: 2,
                                                      fit: FlexFit.loose,
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            controller
                                                                    .list
                                                                    .rows![
                                                                        index]
                                                                    .title ??
                                                                "-",
                                                            style: Theme.of(
                                                                    context)
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
                );
        });
  }
}
