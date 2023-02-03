// import 'package:dartaholics/state/flatmate_search/flatmate.dart';
// import 'package:dartaholics/state/flatmate_search/providers/all_flatmates_provider.dart';
// import 'package:dartaholics/widgets/post_details_view.dart';
// import 'package:dartaholics/widgets/post_thumbnail_view.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class PostGridView extends ConsumerStatefulWidget {
//   const PostGridView({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _PostGridView();
// }

// class _PostGridView extends ConsumerState<PostDetailsView> {
//   @override
//   Widget build(BuildContext context) {
//     final posts = ref
//         .watch(
//           allFlatmatesProvider,
//         )
//         .value!;
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3,
//         mainAxisSpacing: 8.0,
//         crossAxisSpacing: 8.0,
//       ),
//       itemCount: posts.length,
//       itemBuilder: (context, index) {
//         final post = posts.elementAt(index);
//         return PostThumbnailView(
//           flatmate: post,
//           onTapped: () {
//             ///To navigate to the post details view
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => PostDetailsView(
//                   flatmate: post,
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
