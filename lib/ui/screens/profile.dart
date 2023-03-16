import '../../core/resources/app_text_styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../core/injection.dart';
import '../../core/resources/color_manager.dart';
import '../../modules/authentication/auth.dart';
import '../../modules/authentication/ui/main_auth_page.dart';
import '../controllers/home_page_controller.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: -100,
          left: -250,
          child: DecorationCircles(),
        ),
        const Positioned(
          top: -150,
          child: DecorationCircles(),
        ),
        const Positioned(
          top: -100,
          right: -250,
          child: DecorationCircles(),
        ),
        Column(
          children: [
            SizedBox(height: 4.h),
            SizedBox(
              width: 90.w,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 12.w,
                              height: 12.w,
                              decoration: const BoxDecoration(
                                color: ColorManager.grey,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/unknownPerson.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25)),
                                child: const Icon(Icons.camera_alt_rounded),
                              ),
                            )
                          ],
                        ),
                        SizedBox(width: 1.w),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FirebaseAuth.instance.currentUser!.email
                                        ?.split('@')[0] ??
                                    'unkown',
                                style: AppTextStyles.productTitle
                                    .copyWith(color: ColorManager.white),
                              ),
                              Text(
                                FirebaseAuth.instance.currentUser!.email ??
                                    'unkown@mail.com',
                                style: AppTextStyles.productTitle
                                    .copyWith(color: ColorManager.white),
                              ),
                            ]),
                      ],
                    ),
                    const Icon(Icons.edit, color: ColorManager.white),
                  ]),
            ),
            SizedBox(height: 4.h),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          color: ColorManager.cursorColor,
                          offset: Offset(0, 2),
                          blurRadius: 10)
                    ]),
                width: 90.w,
                height: 55.h,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    ...serviceTile('Shipping Address', Icons.location_on),
                    ...serviceTile('Payment Method', Icons.payment),
                    ...serviceTile('Order History', Icons.list),
                    ...serviceTile('Language', Icons.language),
                    ...serviceTile('Rate our app', Icons.star),
                    // ...serviceTile('Language', Icons.language),
                    SizedBox(height: 3.h),
                    TextButton(
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                            color: ColorManager.cursorColor,
                            fontSize: 5.8.sp,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600),
                      ),
                      onPressed: () {
                        Auth(getIt(), getIt()).signOutEmailAndPassword();
                        Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: const MainAuthPage(),
                              type: PageTransitionType.fade),
                        );
                        context
                            .read<HomePageController>()
                            .bottomNavigatorIndexSetter(0);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> serviceTile(String title, IconData iconData) {
    return [
      ListTile(
        leading: Icon(iconData),
        title: Text(title),
        iconColor: ColorManager.cursorColor,
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        child: Divider(
          color: ColorManager.unSelectedIconColor.withOpacity(0.5),
          thickness: 1.5,
        ),
      ),
    ];
  }
}

class DecorationCircles extends StatelessWidget {
  const DecorationCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 380,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.cursorColor,
      ),
    );
  }
}
