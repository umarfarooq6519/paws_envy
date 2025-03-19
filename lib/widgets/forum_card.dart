import 'package:flutter/material.dart';
import 'package:paws_envy/services/db.service.dart';
import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/shadow.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class ForumCard extends StatefulWidget {
  const ForumCard({super.key, required this.post, required this.onRemove});

  final Map<String, dynamic> post;
  final Function(String) onRemove;

  @override
  State<ForumCard> createState() => _ForumCardState();
}

class _ForumCardState extends State<ForumCard> {
  final DBservice _db = DBservice();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: AppColors.secondary,
            ),
            boxShadow: [
              ShadowStyles.smallShadow,
            ],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 10),
                      Text(
                        widget.post['userName']!,
                        style: TextStyles.smallHeading,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      widget.onRemove(widget.post['forumID']);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: AppColors.error,
                      size: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    widget.post['title'],
                    style: TextStyles.baseText.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.post['details']!,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              Divider(
                height: 30,
              ),
              // forum comments
              // Column(
              //   children: [
              //     Row(
              //       children: [
              //         Text(
              //           'ahmad: ',
              //           style: TextStyles.smallText.copyWith(
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //         Text('This is the comment i made'),
              //       ],
              //     ),
              //     SizedBox(height: 15),
              //     TextField(
              //       // controller: _forumComment,
              //       decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius:
              //               BorderRadius.circular(10), // ✅ Circular radius 10
              //           borderSide: BorderSide(
              //             color: Colors.grey[300]!, // ✅ Light gray border
              //             width: 1, // ✅ Border width 1
              //           ),
              //         ),
              //         enabledBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.grey[300]!,
              //           ),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10),
              //           borderSide: BorderSide(
              //             color: Colors.grey, // Slightly darker when focused
              //             width: 1,
              //           ),
              //         ),
              //         contentPadding: EdgeInsets.symmetric(horizontal: 10),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        )
      ],
    );
  }
}
