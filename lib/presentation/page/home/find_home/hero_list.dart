import 'package:apni_jagaah/constant/image_string.dart';
import 'package:apni_jagaah/presentation/theme/app_color.dart';
import 'package:apni_jagaah/presentation/widgets/simple_appbar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

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
        itemBuilder: (context, index) =>
            Hero(
              transitionOnUserGestures: true,
              tag: index,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoViewPP(
                                  imageList: imageList,
                                  index: index,
                                )));
                  },
                  child: SizedBox(
                    height: 280,
                    child: Image(
                      fit: BoxFit.fill,
                      image: imageList[index],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class PhotoViewPP extends StatefulWidget {
  final List<ImageProvider> imageList;
  final int index;

  const PhotoViewPP({Key? key, required this.imageList, required this.index})
      : super(key: key);

  @override
  State<PhotoViewPP> createState() => _PhotoViewPPState();
}

class _PhotoViewPPState extends State<PhotoViewPP> {
  late final PageController _controller;
   int _index =0;

  @override
  void initState() {
    _controller = PageController(initialPage: widget.index);
    _index = widget.index+1;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppbar(title: '${_index.toString()} of ${widget.imageList.length.toString()}',),
      body: PhotoViewGallery.builder(
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: widget.imageList[index],
            initialScale: PhotoViewComputedScale.contained,
          );
        },
        backgroundDecoration: const BoxDecoration(color: AppColor.white),
        itemCount: widget.imageList.length,
        pageController: _controller,
        onPageChanged: (value){
          setState(() {
            _index= value+1;
          });
        },
      ),
    );
  }
}
