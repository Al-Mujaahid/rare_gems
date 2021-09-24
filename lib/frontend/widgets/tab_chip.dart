import 'package:flutter/material.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

class RareGemTabChip extends StatelessWidget {
  RareGemTabChip({Key? key, this.isActive = false, this.text = 'tab item'}) : super(key: key);
  bool isActive;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.5),
      decoration: BoxDecoration(
          color: isActive ? primaryColor : Color(0xFFEFEFF4),
          borderRadius: BorderRadius.all(Radius.circular(14.5))
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: Text("$text", style: subtitleStyle.copyWith(
            fontSize: 13, fontWeight: FontWeight.w400, color: isActive ? Colors.white : Color(0xFF666666)
        ),),
      ),
    );
  }
}
