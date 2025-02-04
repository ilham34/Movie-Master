import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTrending extends StatelessWidget {
  const ShimmerTrending({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.white,
      enabled: true,
      child: SizedBox(
        height: 400,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (_, __) => const SizedBox(
            width: 15,
          ),
          itemBuilder: (_, __) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              width: 250,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
            );
          },
        ),
      ),
    );
  }
}
