import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AssetAudio extends StatefulWidget {
  const AssetAudio({Key? key}) : super(key: key);

  @override
  _AssetAudioState createState() => _AssetAudioState();
}

class _AssetAudioState extends State<AssetAudio> {
  AssetsAudioPlayer player = AssetsAudioPlayer();
  List<Audio> myList = [
    Audio('assets/1.mp3'),
    Audio('assets/2.mp3'),
    Audio('assets/3.mp3'),
    Audio('assets/4.mp3'),
    Audio('assets/5.mp3'),
  ];

  initState() {
    super.initState();
    player.open(Playlist(audios: myList));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Assets Audio'),),
        body: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, ind) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Song $ind'),
                  ElevatedButton(onPressed: () {
                    player.playlistPlayAtIndex(ind);
                  }, child: Icon(Icons.play_arrow))

                ],
              );
            })
    );
  }
}
      //  Center(
      //    child: Column(
      //      children: [
      //        IconButton(icon: Icon(Icons.play_arrow),onPressed: (){
      //          print('play');
      //         // player.open(audio1);
      //          player.playlistPlayAtIndex(index);
      //          },
      // ),
      //        IconButton(icon: Icon(Icons.pause),onPressed: (){
      //          print('stop');
      //          player.pause();},
      //        ),
      //        IconButton(icon: Text('Next Item'),
      //          onPressed: (){
      //          print('next $index');
      //          if(index < myList.length-1){
      //            player.next();
      //            setState(() {
      //              index++;
      //            });
      //          }
      //          else{
      //            setState(() {
      //              index=0;
      //            });
      //            print('Play $index');
      //            player.playlistPlayAtIndex(index);
      //          }
      //          },
      //        ),
      //        Text('We are in $index Song')
      //      ],
      //    ),
     //  ),
//     );
//   }
// }
