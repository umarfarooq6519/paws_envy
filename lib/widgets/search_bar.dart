import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:paws_envy/utils/colors.styles.dart';
import 'package:paws_envy/utils/text.styles.dart';

class SearchBarField extends StatelessWidget {
  const SearchBarField({super.key});

  @override
  // ##### Search bar field #####
  Widget build(BuildContext context) {
    return Container(
      decoration: _containerDecoration(),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: const EdgeInsets.all(15),
          hintText: "Search Anything",
          hintStyle: TextStyles.dimText,
          prefixIcon: _iconPrefix(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: AppColors.primary,
          blurRadius: 15,
          spreadRadius: 0,
        ),
      ],
    );
  }

  Padding _iconPrefix() {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Icon(
        LineIcons.search,
        color: AppColors.gray,
      ),
    );
  }
}
