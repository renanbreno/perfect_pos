import 'package:flutter/material.dart';
import 'package:perfect_pos/styles/theme/theme.dart';

// ignore: must_be_immutable
class FunctionCards extends StatelessWidget {
  String text;
  IconData icon;

  FunctionCards(this.text, this.icon, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: MediaQuery.of(context).size.width / 2,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 0.1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: UITheme.coraColorBrandLighter,
                child: Icon(
                  icon,
                  color: UITheme.coraColorBrandDarker,
                  size: 28,
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 18, color: UITheme.coraColorNeutralDarker),
              )
            ],
          )
        ],
      ),
    );
  }
}
