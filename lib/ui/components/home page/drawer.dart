import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: SafeArea(
        child: Container(
          color: ColorManager.cursorColor,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              ListTile(
                title: Text(user!.email.toString()),
                textColor: ColorManager.white,
                subtitle: Row(
                  children: [
                    Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 58, 255, 65),
                            shape: BoxShape.circle)),
                    const SizedBox(width: 5),
                    const Text('Active Status')
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              const ListTile(
                leading: Icon(Icons.home),
                iconColor: ColorManager.white,
                title: Text('Home'),
                textColor: ColorManager.white,
              ),
              const ListTile(
                leading: Icon(Icons.favorite),
                iconColor: ColorManager.white,
                title: Text('Likes'),
                textColor: ColorManager.white,
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart),
                iconColor: ColorManager.white,
                textColor: ColorManager.white,
                title: Text('Cart'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                iconColor: ColorManager.white,
                textColor: ColorManager.white,
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
