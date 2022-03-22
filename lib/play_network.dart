
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayFromNetwork extends StatefulWidget {
  const PlayFromNetwork({Key? key}) : super(key: key);

  @override
  _PlayFromNetworkState createState() => _PlayFromNetworkState();
}

class _PlayFromNetworkState extends State<PlayFromNetwork> {

  String  Url = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
  late AudioPlayer player;
  bool isPlaying= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player= AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      width:double.infinity ,
      height: double.infinity,
      decoration: BoxDecoration(
       gradient: LinearGradient(
         colors: [
           Colors.blue,
           Colors.indigo,
           Colors.black87
         ]
       )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Text('Network',style: TextStyle(fontSize:30,color:Colors.white ),),
            SizedBox(height: 50,),
                InkWell(
                    onTap: (){
                    if(isPlaying) {
                      stopPlay();
                      setState(() {
                        isPlaying = false;
                      });
                    }
                        else{
                          playFromNet();
                          setState(() {
                            isPlaying =true;
                          });
                    }

                    }, child: Icon(isPlaying?Icons.pause:Icons.play_arrow,size: 45,color: Colors.white,)),

          ],
      ),
     );
  }
  playFromNet()async{
    await player.play(Url);
  }
  stopPlay(){
    player.stop();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    player.dispose();
  }
}
