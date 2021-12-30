import 'package:apni_jagaah/presentation/widgets/simple_text.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    debugPrint('favorite initialize');
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('favorite initialize');
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SimpleText('Favourite'),
    );
  }
}
