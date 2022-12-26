import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

AudioCache audioCache = AudioCache();
var arr1 =['theme_01.mp3','theme_02.mp3','theme_03.mp3'];
int i= 0;
class AudioPlayersWithURL extends StatefulWidget {



  @override
  State<AudioPlayersWithURL> createState() => _AudioPlayersWithURLState();
}

class _AudioPlayersWithURLState extends State<AudioPlayersWithURL> {
  final player = AudioPlayer();


  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  String formatTime(int seconds) {
    return '${(Duration(seconds: seconds))}'.split('.')[0].padLeft(8, '0');
  }


  @override
  void initState() {
    // TODO:implement initState
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuarantion) {
      setState(() {
        duration = newDuarantion;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      position = newPosition;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AudioPlayer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                          Icons.skip_previous,
                    ),onPressed: (){ if (isPlaying) {
                       player.pause();
                       i++;
                       if(i>2){
                         i=0;
                         }
                         else{
                          i=i;

                       }

                       player.play(AssetSource(arr1[i]));

                       }
                        else {
                      player.play(AssetSource(arr1[i]));
                    }

                        }

                    ,
                  ),
                 )    ,













                  CircleAvatar(
                  radius: 25,
                  child:IconButton(icon: Icon(isPlaying ?
                  Icons.pause :Icons.play_arrow,
                  ),
                    onPressed: () {
                      if (isPlaying) {
                        player.pause();
                      }
                      else {
                        player.play(AssetSource('theme_01.mp3'));
                      }
                    },
                  ),
                ),
                  CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      icon: Icon(
                        Icons.skip_next,
                      ),onPressed: (){ if (isPlaying) {
                      player.pause();
                      i--;
                      if(i<0){
                       i=3;

                    }
                     else{
                       i=i;


                    }
                     player.play(AssetSource(arr1[i]));

                 }
                    else {
                      player.play(AssetSource(arr1[i]));
                    }
                    },
                    ),
                  )    ,



                ],
              ),
            ),






            Slider(min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) {
                  final position = Duration(seconds: value.toInt());
                  player.seek(position);
                  player.resume();
                }),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position.inSeconds)),
                  Text(formatTime((duration - position).inSeconds)),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
