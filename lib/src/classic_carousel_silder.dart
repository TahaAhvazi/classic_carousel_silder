import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  int currentPage;
  List<String> images;
  double width, height;
  Color unselectedColor, selectedColor;

  HomePage({
    super.key,
    required this.currentPage,
    required this.images,
    required this.height,
    required this.width,
    this.selectedColor = Colors.black,
    this.unselectedColor = Colors.grey,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              height: widget.height,
              width: widget.width,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    widget.currentPage = value;
                  });
                },
                itemCount: widget.images.length,
                pageSnapping: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      widget.images[index],
                    ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(
              widget.images.length,
              widget.currentPage,
              widget.selectedColor,
              widget.unselectedColor,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> indicators(int imagesLength, int currentIndex, Color selectedColor,
    Color unSelectedColor) {
  return List<Widget>.generate(imagesLength, (index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.all(5),
      width: currentIndex == index ? 14 : 10,
      height: currentIndex == index ? 14 : 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? selectedColor : unSelectedColor,
          shape: BoxShape.circle),
    );
  });
}
