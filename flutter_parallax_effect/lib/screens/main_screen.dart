import 'package:flutter/material.dart';
import 'package:flutter_parallax_effect/screens/video_card.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController controller;

  int _selectedIndex = 0;



  @override
  void initState() {
    controller = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final videos = [
    'assets/videos/video1.mp4',
    'assets/videos/video2.mp4',
    'assets/videos/video3.mp4',
    'assets/videos/video4.mp4',
    'assets/videos/video5.mp4',
    'assets/videos/video6.mp4',
    'assets/videos/video7.mp4',
    'assets/videos/video8.mp4',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.8,
            child: PageView.builder(
              itemCount: videos.length,
              onPageChanged: (i){
                setState(() {
                  _selectedIndex = i;
                });
              },
              itemBuilder: (context, index) {
                return VideosCard(
                  videoPath: videos[index],
                  isSelected: _selectedIndex == index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
