import 'package:flutter/material.dart';

import 'custom_video_player.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final controller = VideoPlayerController.network(
    //     'https://www.greensoft.com.ec/wp-content/uploads/2014/12/Administraci%C3%B3nProyectos.mp4');

    return Scaffold(
      appBar: AppBar(
        title: Text('Video assets'),
      ),
      body: ListView(children: [
        CustomVideoPlayer(
            type: TypeVideoDatasource.network,
            datasource:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
        CustomVideoPlayer(
            type: TypeVideoDatasource.network,
            datasource:
                'https://media.istockphoto.com/videos/abstract-background-with-3d-rings-and-rotating-parts-clean-and-modern-video-id1248225100'),
         CustomVideoPlayer(
           type: TypeVideoDatasource.asset,
           datasource: 'assets/video_local.mp4',
         ),
        // CustomVideoPlayer(),
        // CustomVideoPlayer(),
        // CustomVideoPlayer(),
      ]),
    );
  }
}
