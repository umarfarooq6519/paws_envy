import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:paws_envy/widgets/service_card.dart'; // Import the ServiceCard

class RecentServicesSection extends StatelessWidget {
  const RecentServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Services',
                style: TextStyles.mediumHeading,
              ),
              Text(
                'View All',
                style: TextStyles.smallText,
              )
            ],
          ),
        ),

        const SizedBox(height: 5),

        // Fetch and display services
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('services')
                .orderBy('timestamp', descending: true)
                .limit(5)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return const Center(
                    child: Text("No recent services available"));
              }

              return ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: snapshot.data!.docs.map((doc) {
                  var data = doc.data() as Map<String, dynamic>;
                  final Timestamp timestamp = data['timestamp'];
                  final String timeAgo = timeago.format(timestamp.toDate());

                  return ServiceCard(
                    name: data['providerName'] ?? 'Unknown',
                    serviceType: data['service'] ?? 'Service',
                    time: timeAgo,
                    certified: data['certification'],
                  );
                }).toList(),
              );
            },
          ),
        ),
      ],
    );
  }
}
