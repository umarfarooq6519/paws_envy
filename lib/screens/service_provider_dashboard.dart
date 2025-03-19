import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/primary_btn.dart';
import 'package:paws_envy/widgets/service_card.dart';

class ServiceProviderDashboard extends StatefulWidget {
  const ServiceProviderDashboard({super.key});

  @override
  _ServiceProviderDashboardState createState() =>
      _ServiceProviderDashboardState();
}

class _ServiceProviderDashboardState extends State<ServiceProviderDashboard> {
  final AuthService _auth = AuthService();
  final DBservice _db = DBservice();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  String? selectedService;
  String? certification;
  DateTime? fromDate;
  DateTime? toDate;

  Map<String, dynamic> serviceToMap({
    required String service,
    required String experience,
    required String certification,
  }) {
    return {
      'providerID': _auth.currentUser!.uid,
      'providerEmail': _auth.currentUser!.email,
      'providerName': _auth.currentUser!.displayName,
      'providerAvatar': _auth.currentUser!.photoURL,
      'service': service,
      'experience': experience,
      'certification': certification,
      'timestamp': FieldValue.serverTimestamp(),
    };
  }

  Future<void> handleSubmit() async {
    final experience = experienceController.value.text;

    if (selectedService == null ||
        experience.isEmpty ||
        certification!.isEmpty) {
      return;
    }

    final Map<String, dynamic> service = serviceToMap(
      certification: certification!,
      experience: experience,
      service: selectedService!,
    );

    await _db.addServiceToFirestore(service).then((_) {
      Navigator.pop(context);
      setState(() {});
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    experienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          "Service Provider",
          style: TextStyles.mediumHeading,
        ),
        // centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: _auth.signOut,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('services') // Change to your Firestore collection
              .orderBy('timestamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text("No appointments available."));
            }

            var services = snapshot.data!.docs;

            return ListView.builder(
              itemCount: services.length,
              itemBuilder: (context, index) {
                var service = services[index].data() as Map<String, dynamic>;

                return ServiceCard(
                  certified: service['certification'],
                  name: service['providerName'] ?? 'Unknown Provider',
                  serviceType: service['service'] ?? 'Service Unavailable',
                  time: "${service['experience']} years of experience",
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            showDragHandle: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            builder: (BuildContext context) {
              return SafeArea(
                bottom: true,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Add New Appointment",
                            style: TextStyles.smallHeading,
                          ),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Select Service",
                            // border: OutlineInputBorder(),
                          ),
                          value: selectedService,
                          items: [
                            DropdownMenuItem(
                              value: "pet_sitter",
                              child: Text("Pet Sitter"),
                            ),
                            DropdownMenuItem(
                              value: "pet_walker",
                              child: Text("Pet Walker"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedService = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        // TextField(
                        //   controller: descriptionController,
                        //   decoration: InputDecoration(
                        //     labelText: "Description",
                        //   ),
                        //   maxLines: 3,
                        // ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: experienceController,
                          decoration: InputDecoration(
                            labelText: "Experience (in years)",
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: "Certification",
                          ),
                          value: certification,
                          items: [
                            DropdownMenuItem(
                              value: "yes",
                              child: Text("Yes"),
                            ),
                            DropdownMenuItem(
                              value: "no",
                              child: Text("No"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              certification = value;
                            });
                          },
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(height: 20),
                        PrimaryBtn(onPressed: handleSubmit, text: 'Submit')
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: AppColors.white),
      ),
    );
  }
}
