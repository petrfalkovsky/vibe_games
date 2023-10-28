import 'package:flutter/material.dart';

class HorizontalExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;
  final bool initiallyExpanded;

  HorizontalExpansionTile({
    required this.title,
    this.children = const <Widget>[],
    this.initiallyExpanded = false,
  });

  @override
  _HorizontalExpansionTileState createState() =>
      _HorizontalExpansionTileState();
}

class _HorizontalExpansionTileState extends State<HorizontalExpansionTile> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: widget.title,
          onTap: _handleTap,
          trailing: RotationTransition(
            turns: AlwaysStoppedAnimation(_isExpanded ? 0.5 : 0),
            child: Icon(Icons.expand_more),
          ),
        ),
        _isExpanded
            ? Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: widget.children,
                ),
              )
            : Container(),
      ],
    );
  }
}
