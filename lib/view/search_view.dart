// import 'package:artivatic_assignment/model/mymodel.dart';
// import 'package:artivatic_assignment/services/api_service.dart';
// import 'package:flutter/material.dart';

// class SearchView extends SearchDelegate {
//   final ApiService _apiService = ApiService();
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             if (query.isNotEmpty) {
//               query = '';
//             } else {
//               close(context, query);
//             }
//           },
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           close(context, query);
//         },
//         icon: const Icon(Icons.arrow_back_ios));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return FutureBuilder<MyModel>(
//       future: _apiService.fetchData(query: query),
//       builder: ((context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (!snapshot.hasData) {
//             return const Center(
//               child: Text('No Data'),
//             );
//           } else {
//             List<Rows> data = snapshot.data!.rows!;
//             return ListView.builder(
//                 itemCount: data.length,
//                 itemBuilder: ((context, index) {
//                   return ListTile(
//                     title: Text(data[index].title ?? "--"),
//                   );
//                 }));
//           }
//         } else {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//       }),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return const Center(
//       child: Text('Search you data'),
//     );
//     // final List<Rows> suggestions = listSuggestion!
//     //     .where(
//     //       (element) => element.title!.toLowerCase().contains(
//     //             query.toLowerCase(),
//     //           ),
//     //     )
//     //     .toList();
//     // return ListView.builder(
//     //   itemCount: suggestions.length,
//     //   itemBuilder: ((context, index) {
//     //     return ListTile(
//     //       title: Text(suggestions[index].title ?? "-"),
//     //       onTap: () {
//     //         query = suggestions[index].title ?? "-";
//     //         close(context, query);
//     //       },
//     //     );
//     //   }),
//     // );
//   }
// }
