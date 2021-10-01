import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


enum TypeVideoDatasource{
  asset,
  network,
  file
}

class CustomVideoPlayer extends StatefulWidget {
  // final controller = VideoPlayerController.asset('assets/video_local.mp4');
  final String datasource;
  final TypeVideoDatasource type;
  
  CustomVideoPlayer({
    Key? key,
    required this.datasource,
    required this.type
  }) : super(key: key);

  @override
  _CustomVideoPlayerState createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late VideoPlayerController _controller ;

  int duracion = 0;
  bool startPlaying = false;

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case TypeVideoDatasource.network:
        _controller = VideoPlayerController.network(widget.datasource);
        break;
      case TypeVideoDatasource.asset:
        _controller = VideoPlayerController.asset(widget.datasource);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    // widget.controller.addListener(() {
    //   getPosicion();
    // });

    this._controller.addListener(() {
      if (startPlaying && this._controller.value.isPlaying) {
        //widget.controller.position.then((value) => duracion = value!.inSeconds);
        //print('aqui');
      }
    });

    return FutureBuilder(
        future: this._controller.initialize(),
        builder: (context, snapshot) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              this._controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: this._controller.value.aspectRatio,
                      child: VideoPlayer(this._controller),
                    )
                  : Container(
                      child: Text('Cargando'),
                    ),
              VideoProgressIndicator(
                this._controller,
                allowScrubbing: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      this._controller.seekTo(Duration(seconds: 0));
                    },
                    icon: Icon(Icons.first_page, size: 50),
                  ),
                  IconButton(
                    onPressed: () {
                      if (startPlaying)
                        this._controller.pause();
                      else
                        this._controller.play();
                      setState(() {
                        startPlaying = !startPlaying;
                      });
                    },
                    icon: Icon((startPlaying) ? Icons.pause : Icons.play_arrow,
                        size: 50),
                  ),
                  IconButton(
                    onPressed: () {
                      this._controller.seekTo(Duration(seconds: 1000000));
                    },
                    icon: Icon(Icons.last_page, size: 50),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<void> getPosicion() async {
    var posicion = await this._controller.position;
    if (posicion != null) {
      setState(() {
        duracion = posicion.inSeconds;
      });
    }

  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
