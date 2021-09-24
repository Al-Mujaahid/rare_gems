import 'package:flutter/material.dart';
import 'package:rare_gem/utils/styles/colors.dart';

// Button Types

class RareGemFilledButton extends StatelessWidget {
  RareGemFilledButton({ Key? key, required this.child, required this.color }) : super(key: key);
  Widget child;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
      alignment: Alignment.center,
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    );
  }
}

class RareGemFilledSmallButton extends StatelessWidget {
  RareGemFilledSmallButton({ Key? key, required this.child, required this.color }) : super(key: key);
  Widget child;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      alignment: Alignment.center,
      child: child,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    );
  }
}

class RareGemOutlineBigButton extends StatelessWidget {
  RareGemOutlineBigButton({ Key? key, required this.child, required this.color }) : super(key: key);
  Widget child;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
      alignment: Alignment.center,
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: color, width: 1)
      ),
    );
  }
}

class RareGemOutlineButton extends StatelessWidget {
  RareGemOutlineButton({ Key? key, required this.child, required this.color }) : super(key: key);
  Widget child;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      alignment: Alignment.center,
      child: child,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: color, width: 1)
      ),
    );
  }
}

class RareGemOutlineSmallButton extends StatelessWidget {
  RareGemOutlineSmallButton({ Key? key, required this.child, required this.color }) : super(key: key);
  Widget child;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      alignment: Alignment.center,
      child: child,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: color, width: 1)
      ),
    );
  }
}

class RareGemPrimaryButton extends StatelessWidget {
  RareGemPrimaryButton({ Key? key, required this.child, this.onClick }) : super(key: key);
  Widget child;
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick == null ? () {} : () => onClick!(),
      child: RareGemFilledButton(child: child, color: onClick ==null ? Color(0xFF666666) : primaryColor)
    );
  }
}

class RareGemPrimarySmallButton extends StatelessWidget {
  RareGemPrimarySmallButton({ Key? key, required this.child, this.onClick }) : super(key: key);
  Widget child;
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onClick!(),
        child: RareGemFilledSmallButton(child: child, color: onClick ==null ? Color(0xFF666666) : primaryColor)
    );
  }
}

class RareGemPrimaryOutlineSmallButton extends StatelessWidget {
  RareGemPrimaryOutlineSmallButton({ Key? key, required this.child, this.onClick }) : super(key: key);
  Widget child;
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onClick!(),
        child: RareGemOutlineSmallButton(child: child, color: onClick ==null ? Color(0xFF666666) : primaryColor)
    );
  }
}

class RareGemPrimaryOutlineButton extends StatelessWidget {
  RareGemPrimaryOutlineButton({ Key? key, required this.child, this.onClick }) : super(key: key);
  Widget child;
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick!(),
      child: RareGemOutlineButton(child: child, color: onClick ==null ? Color(0xFF666666) : primaryColor)
    );
  }
}

class RareGemPrimaryOutlineBigButton extends StatelessWidget {
  RareGemPrimaryOutlineBigButton({ Key? key, required this.child, this.onClick }) : super(key: key);
  Widget child;
  Function? onClick;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick!(),
      child: RareGemOutlineBigButton(child: child, color: onClick ==null ? Color(0xFF666666) : primaryColor)
    );
  }
}