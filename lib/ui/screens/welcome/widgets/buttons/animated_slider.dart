import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: Colors.blue,
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Нажмите,         чтобы              свернуть/развернуть',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        ConstrainedBox(
          constraints: isExpanded
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 0),
          child: AnimatedCrossFade(
            firstChild: Container(
              color: Colors.green,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Этот контейнер может сворачиваться \n\n\n\n\n и разворачиваться на высоту контента внутри.',
                style: TextStyle(color: Colors.white),
              ),
            ),
            secondChild: Container(),
            crossFadeState: isExpanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 300),
          ),
        ),
      ],
    );
  }
}
