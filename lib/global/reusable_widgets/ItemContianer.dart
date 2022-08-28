import 'package:flutter/material.dart';

class ItemContianer extends StatelessWidget {
  const ItemContianer({Key? key, required this.itemName}) : super(key: key);
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30.0,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade500,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemName,
            style:const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
          )
        ],
      ),
    );

  }
}
