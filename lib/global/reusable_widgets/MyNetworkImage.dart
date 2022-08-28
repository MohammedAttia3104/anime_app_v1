import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: CachedNetworkImage(
        imageUrl:url,
        errorWidget: (context, url, error) {
          return const Center(
            child:  Text(
              'An error occurred',
            ),
          );
        },
        placeholder: (context, url) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
