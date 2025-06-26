import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatelessWidget {
  const ShimmerLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: const ListTile(
          leading: CircleAvatar(radius: 30, backgroundColor: Colors.white),
          title: SizedBox(
            height: 10,
            width: 80,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          subtitle: SizedBox(
            height: 10,
            width: 60,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
