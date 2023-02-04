import 'package:flutter/material.dart';
import 'package:flutter_parallax_effect/widgets/parallax_widget.dart';
import 'package:video_player/video_player.dart';

class VideosCard extends StatefulWidget {
  final String videoPath;
  final bool isSelected;

  const VideosCard({
    Key? key,
    required this.videoPath,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<VideosCard> createState() => _VideosCardState();
}

class _VideosCardState extends State<VideosCard> {
  late VideoPlayerController controller;

  final GlobalKey videoKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.asset(widget.videoPath);

    controller
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0)
      ..initialize().then((_) => setState(() {}))
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 500),
      margin: widget.isSelected
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8.0,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Flow(
          delegate: ParallaxFlowDelegate(
            scrollable: Scrollable.of(context),
            listItemContext: context,
            backgroundImageKey: videoKey,
          ),
          children: [
            AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(
                controller,
                key: videoKey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
