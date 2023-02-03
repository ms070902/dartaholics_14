import 'package:dartaholics/state/flatmate_search/flatmate.dart';
import 'package:dartaholics/state/flatmate_search/providers/all_flatmates_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PostDetailsView extends ConsumerStatefulWidget {
  final Flatmate flatmate;

  const PostDetailsView({
    required this.flatmate,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostDetailsView();
}

class _PostDetailsView extends ConsumerState<PostDetailsView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title: const Text('Flat'),
      ),
    );
  }
}
