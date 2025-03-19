import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paws_envy/widgets/community_pet_card.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paws_envy/services/auth.service.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';
import 'package:paws_envy/widgets/forum_card.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final DBservice _db = DBservice();
  final AuthService _auth = AuthService();

  final TextEditingController _commentController = TextEditingController();

  final List<String> categories = ["Lost & Found", "Pet Adoption", "Forums"];
  int selectedIndex = 0;

  User? currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Text('Community',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text('Connect, Share, and Care for Paws!',
                  textAlign: TextAlign.center),
            ],
          ),
        ),

        // Category Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(categories.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ChoiceChip(
                  checkmarkColor: Colors.white,
                  label: Text(categories[index]),
                  selected: selectedIndex == index,
                  onSelected: (bool selected) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  selectedColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  // backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                      color:
                          selectedIndex == index ? Colors.white : Colors.black),
                ),
              );
            }),
          ),
        ),

        SizedBox(height: 10),

        // Content Based on Selection
        Expanded(
          child: selectedIndex == 0
              ? _buildLostFoundSection()
              : selectedIndex == 1
                  ? _buildPetAdoptionSection()
                  : _buildForumsSection(),
        ),
      ],
    );
  }

  void _showAddForumScreen() {
    TextEditingController _postTitleController = TextEditingController();
    TextEditingController _postDetailsController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Create Forum Post",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),

              // Post Title Field
              TextField(
                controller: _postTitleController,
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
              ),
              SizedBox(height: 10),

              // Post Details Field
              TextField(
                controller: _postDetailsController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Details",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                ),
              ),
              SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  _db.addForumPost(_postTitleController.value.text,
                      _postDetailsController.value.text);
                  setState(() {});
                  Navigator.pop(context);
                },
                child: Text("Post"),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45), // Full width
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void handleForumRemove(String forumID) async {
    await _db.removeForumPost(forumID);
    setState(() {});
  }

  Widget _buildForumsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Add Post Button
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                ShadowStyles.smallShadow,
              ],
            ),
            child: IconButton(
              onPressed: _showAddForumScreen,
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10), // Spacing

          // Forum Posts
          Expanded(
            // ✅ Wrap FutureBuilder in Expanded
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _db.fetchForumPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No forums yet'));
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data![index];
                    return ForumCard(post: post, onRemove: handleForumRemove);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLostFoundSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _db.fetchLostFound(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Pets Found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final profile = snapshot.data![index];
            return CommunityPetCard(profile: profile);
          },
        );
      },
    );
  }

  Widget _buildPetAdoptionSection() {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: _db.fetchAdoptionListing(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No Pets Found'));
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final profile = snapshot.data![index];
            return CommunityPetCard(profile: profile);
          },
        );
      },
    );
  }
}
