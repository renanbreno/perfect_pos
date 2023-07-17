import 'package:perfect_pos/components/MetricsHomeCard/metrics_home_card.dart';
import 'package:perfect_pos/styles/theme/theme.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({super.key});

  @override
  State<HomeHeader> createState() => HomeHeaderState();
}

class HomeHeaderState extends State<HomeHeader> {
  bool visibleValues = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: UITheme.coraColorBrandDark),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bom dia, ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24),
                    ),
                    Text(
                      "pegar o nome",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      spacing: 20,
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () => {
                                    setState(() {
                                      visibleValues = !visibleValues;
                                    })
                                  },
                              icon: visibleValues
                                  ? const Icon(
                                      Icons.visibility_outlined,
                                      color: UITheme.coraColorBrandMedium,
                                      size: 32,
                                    )
                                  : const Icon(
                                      Icons.visibility_off_outlined,
                                      color: UITheme.coraColorBrandMedium,
                                      size: 32,
                                    )),
                        ),
                        const CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: Text(
                            "LL",
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: UITheme.coraColorBrandMedium),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        HomeCard(visibleValues),
      ],
    );
  }
}
