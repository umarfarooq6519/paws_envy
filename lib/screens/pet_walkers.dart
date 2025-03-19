import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/service_card.dart';
import 'package:timeago/timeago.dart' as timeago;

class PetWalkersScreen extends StatelessWidget {
  const PetWalkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("Pet Walkers", style: TextStyles.mediumHeading),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('services')
            .where('service',
                isEqualTo: 'pet_walker') // Filter only pet walkers
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No pet walkers available"));
          }

          return ListView(
            padding: EdgeInsets.all(16),
            children: snapshot.data!.docs.map((doc) {
              var data = doc.data() as Map<String, dynamic>;
              final Timestamp timestamp = data['timestamp'] as Timestamp;
              final String timeAgo = timeago.format(timestamp.toDate());

              return ServiceCard(
                name: data['providerName'],
                serviceType: data['service'],
                time: timeAgo,
                certified: data['certification '],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class PetWalkerCard extends StatelessWidget {
  final String name;
  final String experience;
  final bool certified;

  const PetWalkerCard({
    super.key,
    required this.name,
    required this.experience,
    required this.certified,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: TextStyles.baseText),
                if (certified)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text("Certified",
                        style:
                            TextStyles.dimText.copyWith(color: Colors.white)),
                  ),
              ],
            ),
            SizedBox(height: 8),
            Text("Experience: $experience years", style: TextStyles.dimText),
          ],
        ),
      ),
    );
  }
}
