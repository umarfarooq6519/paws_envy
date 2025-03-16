import 'package:flutter/material.dart';
import 'package:paws_envy/services/cat.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class NearbyPetCare extends StatelessWidget {
  NearbyPetCare({super.key});

  final Future<List<dynamic>> _catsList = CatService.fetchCats();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<dynamic>>(
            future: _catsList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text("No cat data available"));
              } else {
                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final cat = snapshot.data![index];
                      final name = (cat['breeds'] as List).isNotEmpty
                          ? cat['breeds'][0]['name']
                          : "Unknown";
                      final imageUrl = cat['url'] ?? "";

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        width: 160,
                        decoration: _cardDecoration(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _petAvatar(imageUrl),
                            const SizedBox(height: 5),
                            _petLabel(name),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        ShadowStyles.smallShadow,
      ],
    );
  }

  Chip _petLabel(String name) {
    return Chip(
      backgroundColor: AppColors.primaryAccent,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      label: Text(name, style: TextStyles.baseText),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: AppColors.black, width: 1),
      ),
    );
  }

  CircleAvatar _petAvatar(String imageUrl) {
    return CircleAvatar(
      radius: 44,
      backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
      backgroundColor: Colors.grey[300],
    );
  }
}
