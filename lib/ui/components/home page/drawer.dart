import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/themes/app_light_theme.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: SafeArea(
        child: Container(
          color: AppLightTheme.cursorColor,
          child: Column(
            children: [
              SizedBox(height: 5.h),
              ListTile(
                title: Text(user!.email.toString()),
                textColor: AppLightTheme.canvasColor,
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
                iconColor: Colors.white,
                title: Text('Home'),
                textColor: Colors.white,
              ),
              const ListTile(
                leading: Icon(Icons.favorite),
                iconColor: Colors.white,
                title: Text('Likes'),
                textColor: Colors.white,
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart),
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text('Cart'),
              ),
              const ListTile(
                leading: Icon(Icons.person),
                iconColor: Colors.white,
                textColor: Colors.white,
                title: Text('Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
