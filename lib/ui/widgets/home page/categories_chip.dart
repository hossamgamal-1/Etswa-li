import 'package:flutter/material.dart';

import '../../../data/database/remote_database.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: RemoteDatabase.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 1.2),
              ),
              child: Center(
                child: Text(
                  RemoteDatabase.categories[index],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ));
        });
  }
}
