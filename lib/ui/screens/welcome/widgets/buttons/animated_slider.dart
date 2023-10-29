// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:vibe_games/ui/screens/welcome/welcome_exports.dart';
import 'package:vibe_games/ui/shared/constants/app_colors.dart';

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({super.key});

  @override
  State<MyExpansionPanel> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        children: <Widget>[
          ExpansionTile2(
            collapsedIconColor: Colors.transparent,
            iconColor: Colors.transparent,
            leading: null,
            backgroundColor: AppColors.background[1]?.withOpacity(0.3),
            title: const Text(''),
            onExpansionChanged: (bool isExpanded) {
              setState(() {
                _isExpanded = isExpanded;
              });
            },
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Transform.rotate(
                  angle: -11,
                  child: Expanded(
                    child: Row(
                      children: const [
                        Text('Скрытое содержимое/n/n/n/n/n/n панели'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
