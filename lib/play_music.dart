import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
class PlayMusic extends StatefulWidget {
  const PlayMusic({Key? key}) : super(key: key);

  @override
  _PlayMusicState createState() => _PlayMusicState();
}


class _PlayMusicState extends State<PlayMusic> {
  late AudioPlayer player;
  late AudioCache cache;
  bool isPlaying =false;
   Duration currentPostion = Duration();
   Duration musicLength = Duration();
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
    cache = AudioCache(fixedPlayer: player);
    cache.load('am.mp3');
    setUp();
  }
  setUp(){
   player.onAudioPositionChanged.listen((d) {
     setState(() {
       currentPostion = d;
     });
     player.onDurationChanged.listen((d) {
       setState(() {
         musicLength= d;
       });
     });
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 400,
            width: double.infinity,
            child: Text('Play Music', style: TextStyle(fontSize: 35, color: Colors.white),),
            alignment: Alignment.center,
            color: Colors.indigo,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${currentPostion.inSeconds}'),
              Container(
                  width: 300,
                  child: Slider(
                      value: currentPostion.inSeconds.toDouble(),
                      max: musicLength.inSeconds.toDouble(),
                      onChanged: (val){
                        seekTo(val.toInt());
                      })
              ),
              Text('${musicLength.inSeconds}'),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: (){
                if(currentPostion.inSeconds ==0 || currentPostion.inSeconds <10){
                  seekTo(0);
                }
                else if(currentPostion.inSeconds >10){
                  seekTo(currentPostion.inSeconds -10);
                }
              }, icon: Icon(Icons.first_page), iconSize: 35,),
              IconButton(onPressed: (){
               if(isPlaying)
                 {
                   setState(() {
                     isPlaying = false;
                   });
                   stopMusic();
                 }
               else {
                 setState(() {
                   isPlaying = true;
                 });
                 playMusic();
               }
              },
                icon: isPlaying?Icon(Icons.pause): Icon(Icons.play_arrow), iconSize: 35,),
              IconButton(onPressed: (){
                if(currentPostion < musicLength - Duration(seconds: 10)){
                  seekTo(currentPostion.inSeconds + 10);
                }
                else {
                  seekTo(musicLength.inSeconds);
                  setState(() {
                    isPlaying = false;
                  });
                  player.stop();
                }

              }, icon: Icon(Icons.last_page), iconSize: 35,)
            ],
          )
        ],
      ),
    );
  }
  playMusic()
  {
    cache.play('am.mp3');
  }
  stopMusic()
  {
    player.pause();
  }
  seekTo(int sec)
  {
    player.seek(Duration(seconds: sec));
  }
}
