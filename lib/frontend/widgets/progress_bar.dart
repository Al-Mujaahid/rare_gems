import 'package:flutter/material.dart';
import 'package:rare_gem/utils/styles/colors.dart';

class RareGemProgressBar extends StatelessWidget {
  RareGemProgressBar({Key? key, this.percentage = 0, this.color = primaryColor}) : super(key: key);
  double percentage;
  Color color;
  @override
  Widget build(BuildContext context) {
    print(percentage);
    percentage = ((percentage / 100) * MediaQuery.of(context).size.width.ceil()).clamp(0, MediaQuery.of(context).size.width);
    print("Percentage: $percentage : ${MediaQuery.of(context).size.width.ceil()}");
    return Stack(
      children: [
        Container(
          height: 5,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xFFEFEFF4))
          ),
        ),
        Container(
          width: percentage,
          height: 5,
          decoration: BoxDecoration(
              color: color == null ? primaryColor : color,
              border: Border.all(color: Color(0xFFEFEFF4)
            )
          ),
        ),
      ],
    );
  }
}
