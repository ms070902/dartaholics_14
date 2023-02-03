import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/providers/card_providers.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key, required this.urlImage});

  final String urlImage;

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: buildFrontCard(),
    );
  }

  Widget buildFrontCard() => GestureDetector(
      child: LayoutBuilder(builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;

        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 180;
        final rotatedMatrix = Matrix4.identity()
          ..translate(center.dx, center.dy)
          ..rotateZ(angle)
          ..translate(-center.dx, -center.dy);
        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          transform: rotatedMatrix..translate(position.dx, position.dy),
          child: buildCard(),
        );
      }),
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) => () {
            final provider = Provider.of<CardProvider>(context, listen: false);
            provider.updatePosition(details);
          },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endPosition();
      });

  Widget buildCard() => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(widget.urlImage),
            fit: BoxFit.cover,
            alignment: const Alignment(-0.3, 0),
          )),
        ),
      );
}
