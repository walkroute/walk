import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_font.dart';

class ThemeDrawer extends StatefulWidget {
  ThemeDrawer({super.key});

  @override
  State<ThemeDrawer> createState() => _ThemeDrawerState();
}

class _ThemeDrawerState extends State<ThemeDrawer> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffEAE8F4),
      width: MediaQuery.of(context).size.width * 0.8,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppFont(
                    '라이트 모드',
                    size: 23,
                  ),
                  Switch(
                    value: isLightMode,
                    inactiveThumbColor: const Color(0xff28222B),
                    inactiveTrackColor: const Color(0xffDEDEDE),
                    onChanged: (ck) {
                      setState(() {
                        isLightMode = ck;
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}