import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'custom_video_player.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = VideoPlayerController.asset('assets/video_local.mp4');
    // final controller = VideoPlayerController.network(
    //     'https://www.greensoft.com.ec/wp-content/uploads/2014/12/Administraci%C3%B3nProyectos.mp4');

    return Scaffold(
      appBar: AppBar(
        title: Text('Video assets'),
      ),
      body: FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          return CustomVideoPlayer(
            controller: controller,
          );
        },
      ),
    );
  }
}
