import 'package:flutter/material.dart';
import 'package:islamic_ai/features/answer/widgets/widgets.dart';

class ReferenceList extends StatelessWidget {
  const ReferenceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return const ReferenceItem();
      },
    );
  }
}
