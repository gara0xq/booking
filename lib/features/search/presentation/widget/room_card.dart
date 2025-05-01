import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class RoomCard extends StatelessWidget {
  final double width;
  final String name;
  final String imageUrl;
  final String description;
  final double price;

  const RoomCard({
    super.key,
    required this.width,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      height: width >= 1000 ? 200 : width / 4,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: black),
      ),
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(
                    imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
                AutoSizeText(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 3,
                ),
                InkWell(
                  onTap: null,
                  child: Text(
                    "Show in map",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 10,
              children: [
                Text(
                  "$price EGP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: null,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width / 80),
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: AutoSizeText(
                      "Show prices",
                      maxLines: 1,
                      style: TextStyle(color: white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
