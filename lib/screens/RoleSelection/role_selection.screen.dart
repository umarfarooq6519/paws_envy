import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/secondary_btn.dart';

class RoleSelectionPage extends StatelessWidget {
  RoleSelectionPage({super.key});

  final AuthService _auth = AuthService();

  final DBservice _db = DBservice();

  get firstName => _auth.currentUser!.displayName?.split(' ')[0];

  Future<void> handleSignOut() async {
    await _auth.signOut();
    print('User Signed Out');
  }

  @override
  // ##### Role Selection Screen #####
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryAccent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ~ header
              Text(
                'Welcome, $firstName',
                style: TextStyles.xLargeHeading,
              ),
              const Text(
                'Please define your role to continue',
                style: TextStyles.mediumText,
              ),

              const SizedBox(height: 30),

              // ~ content
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    PrimaryBtn(
                      onPressed: () {
                        _db
                            .updateUserRole(_auth.currentUser!.uid, 'pet_owner')
                            .then((_) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/widget_tree', (route) => false);
                        });
                      },
                      text: 'Pet Owner',
                    ),
                    const SizedBox(height: 15),
                    SecondaryBtn(
                      onPressed: () {
                        _db
                            .updateUserRole(_auth.currentUser!.uid, 'vet')
                            .then((_) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/widget_tree', (route) => false);
                        });
                      },
                      text: 'Veterinarian',
                    ),
                    const SizedBox(height: 15),
                    SecondaryBtn(
                        onPressed: () {
                          _db
                              .updateUserRole(
                                  _auth.currentUser!.uid, 'service_provider')
                              .then((_) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/widget_tree', (route) => false);
                          });
                        },
                        text: 'Service Provider'),
                    const SizedBox(height: 10),
                    // Text(
                    //   '*As a veterinarian, we would prompt you to provide your certification.',
                    //   style: TextStyles.smallText,
                    //   textAlign: TextAlign.center,
                    // ),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              // ~ footer
              _signoutBtn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signoutBtn() => OutlinedButton(
        onPressed: () {
          handleSignOut();
        },
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              size: 16,
            ),
            SizedBox(width: 8),
            Text(
              'Sign Out',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
}
