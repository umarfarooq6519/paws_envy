import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:paws_envy/config/firebase/auth.config.dart';

import 'package:paws_envy/config/utils/colors.dart';
import 'package:paws_envy/config/utils/text.styles.dart';
import 'package:paws_envy/models/pets.model.dart';
import 'package:paws_envy/models/services.model.dart';
import 'package:paws_envy/models/activity.model.dart';
import 'package:paws_envy/widgets/bottom_nav.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  List<Widget> iconBody = const [
    Icon(Icons.home),
    Icon(Icons.library_books),
    Icon(Icons.camera),
    Icon(Icons.pets),
    Icon(Icons.person),
  ];

  // List<PetsModel> categories = [];

  Future<void> handleSignOut(context) async {
    await AuthModel().signOut();
    print('User Signed Out');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarSection(),
      body: _body(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.all(14),
          child: BottomNav(),
        ),
      ),
    );
  }

  AppBar _appBarSection() {
    return AppBar(
      iconTheme: const IconThemeData(
        size: 28,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            LineIcons.bars,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LineIcons.bell,
                ),
              ),
              IconButton(
                onPressed: () {
                  handleSignOut(context);
                },
                icon: const CircleAvatar(),
              ),
            ],
          ),
        )
      ],
    );
  }

  ListView _body() {
    return ListView(
      children: [
        _searchField(),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Pals',
                style: TextStyles.mediumHeading,
              ),
              Text('See All')
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Horizontal ListView for pets
        _yourPetsSection(),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pet Services',
                style: TextStyles.mediumHeading,
              ),
              Text('See All')
            ],
          ),
        ),
        const SizedBox(height: 8),
        _servicesSection(),
        const SizedBox(height: 35),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Activity',
                style: TextStyles.mediumHeading,
              ),
              Text('See All')
            ],
          ),
        ),
        _activitySection()
      ],
    );
  }

  Column _activitySection() {
    return Column(
      children: activities.map((activity) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color:
                AppColors.lightPurple.withOpacity(0.5), // Card background color
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.gray.withOpacity(0.6)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon on the left
              Icon(
                activity.icon,
                size: 30,
                color: Colors.black,
              ),
              const SizedBox(width: 16),
              // Activity title and time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activity.title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      activity.time,
                      style:
                          const TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(15), // Set the desired radius here
                child: Image.asset(
                  activity.imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  SizedBox _servicesSection() {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        itemCount: services.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 170,
                height: double.infinity,
                child: Container(
                  decoration: BoxDecoration(
                      // color: AppColors.lightPurple,
                      border: Border.all(
                        color: AppColors.gray,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      services[index].icon,
                      const SizedBox(width: 5),
                      Text(services[index].name),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox _yourPetsSection() {
    return SizedBox(
      height: 210, // Height for the horizontal list
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: pets.length,
        itemBuilder: (context, index) {
          final pet = pets[index];
          // each card container
          return Container(
            width: 180,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lightPurple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Image section
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      child: Image.asset(
                        pet.imageUrl,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Name section with expanded container
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pet.name,
                            style: TextStyles.smallHeading,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${pet.petType} / ${pet.age}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.lightPurple,
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search Anything",
            hintStyle: TextStyles.dimText,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(15),
              child: Icon(
                LineIcons.search,
                color: AppColors.gray,
              ),
            ),
            suffixIcon: SizedBox(
              width: 70,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: AppColors.black,
                      thickness: 0.2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(
                        LineIcons.horizontalSliders,
                        color: Colors.deepPurple[200],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
