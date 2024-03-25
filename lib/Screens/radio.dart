import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/theme_controll.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({super.key});

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  bool play_pause =true;
  AssetImage  play=AssetImage("assets/icons/backwardIcon.png");
  Icon pause = Icon(Icons.pause);
  Widget? x;
  @override
  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 80),
      child: Column(
        children: [
          Image.asset("assets/image/radioPhoto.png"),
          SizedBox(height: 50),
          Text(
              "إذاعة القرآن الكريم",
            style: TextStyle(
              fontFamily: "ELMessiri",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: vm.isDark() ? Colors.white :Colors.black,
            ),

          ),
          SizedBox(height: 50),
          Container(
            width: 194,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageIcon(AssetImage("assets/icons/backwardIcon.png")),
                Spacer(),
                InkWell(
                    onTap: (){
                      if(play_pause==true){
                        play_pause=false;
                        setState(() {});
                      }
                      else{
                        play_pause=true;
                        setState(() {});
                      }
                    },
                    child: ImageIcon(((play_pause==true)?AssetImage("assets/icons/playIcon.png"):AssetImage("assets/icons/pause.png")))),
                Spacer(),
                ImageIcon(AssetImage("assets/icons/nextIcon.png")),

              ],
            ),
          )
        ],
      ),
    );
  }
}
