import 'package:flutter/material.dart';

void showLostFoundModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows full-screen modal
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
            Text("Lost and Found",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Pet Name"),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(labelText: "Pet Type"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                Navigator.pop(context);
              },
              child: Text("Submit"),
            ),
          ],
        ),
      );
    },
  );
}
