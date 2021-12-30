import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';


class HeroList extends StatelessWidget {
  final List<ImageProvider> imageList;
  final int heroId;

  const HeroList({Key? key, required this.imageList, required this.heroId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppbar(),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) => Hero(
          tag: index,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Container(
              color: Colors.amber,
              height: 280,
              child: Image(
                fit: BoxFit.fill,
                image: imageList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}