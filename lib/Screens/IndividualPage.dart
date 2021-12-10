import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Model/ChatModel.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({Key? key, this.chatModel}) : super(key: key);
  final chatModel ;

  @override
  _IndividualPageState createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueGrey,

      appBar: AppBar(

        leadingWidth: 70,
        titleSpacing: 0,


        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/groups.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 36,
                  width: 36,
                ),
                radius: 20,
                backgroundColor: Colors.blueGrey,
              ),
            ],
          ),
        ),

        title: InkWell(

          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.chatModel.name,
                      style: TextStyle( fontSize: 18.5, fontWeight: FontWeight.bold,   ),
                    ),
                    Text(
                      "last seen today at 11:56",
                      style: TextStyle(  fontSize: 13,),
                    ),
                  ]
              ) // column
          ), // container
        ), // title


        actions: [
          IconButton(icon: Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Text("View conatct"),
                  value: "View contact",
                ),
                PopupMenuItem(
                  child: Text("Media,links and docs"),
                  value: "Media,links and docs",
                ),
                PopupMenuItem(
                  child: Text("Whatsapp web"),
                  value: "Whatsapp web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notifications"),
                  value: "Mute notifications",
                ),
                PopupMenuItem(
                  child: Text("Wallpaper"),
                  value: "Wallpaper",
                ),
              ];
            },// item builder
          ),// popup menu button
        ], // actions
      ), // app bar


      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WillPopScope(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                     Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                            margin: EdgeInsets.only(left:2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(  borderRadius: BorderRadius.circular(25),   ),
                            child: TextFormField(
                              controller : _controller,
                              focusNode: focusNode,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              minLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                prefixIcon: IconButton(
                                  icon: Icon(
                                    Icons.emoji_emotions_outlined,
                                  ),
                                  onPressed: () {
                                    focusNode.unfocus();
                                    focusNode.canRequestFocus = false;
                                    setState(() {
                                      show = !show;
                                    });
                                  }, // on pRessed
                                ), // icon button
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.attach_file),
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder)=>
                                                bottomsheet());
                                      },
                                    ), // icon Button
                                    IconButton(
                                      icon: Icon(Icons.camera_alt),
                                      onPressed: () {},
                                    ), // icon Pressed
                                  ],
                                ), // row suffix

                                contentPadding: EdgeInsets.all(5),
                              ), // decorations
                            ), // text form field
                          ), // card
                        ), // container

                        Padding(
                            padding: const EdgeInsets.only(
                              bottom: 8,
                              right: 5,
                              left: 2,
                            )),

                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFF128C7E),
                          child: IconButton(
                            icon: Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ), // icon button
                        ), // circle Avataar
                      ], // children
                    ), // row
                  ], // children
                ), // column
              ), // align

              show?emojiSelect():Container(),
            ], // children
          ),    // stack


          onWillPop: (){
            if (show) {
              setState(() {  show = false;  });
            } else {
              Navigator.pop(context);
            }
            return Future.value(false);
          } ,
        ), // onwill Scope
      ), // container


    ); // retun scaffold

  } // build

  Widget bottomsheet()
  {
    return Container(
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Card(
          margin: EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10, vertical:20),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconcreation(
                            Icons.insert_drive_file, Colors.indigo,"Documents"),
                        SizedBox(
                          width: 40,
                        ),
                        iconcreation(
                            Icons.camera_alt, Colors.pink,"Camera"),
                        SizedBox(
                          width: 40,
                        ),
                        iconcreation(
                            Icons.insert_photo, Colors.purple,"Gallery"),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        iconcreation(
                            Icons.headset, Colors.orange,"Audio"),
                        SizedBox(
                          width: 40,
                        ),
                        iconcreation(
                            Icons.location_pin, Colors.teal,"Location"),
                        SizedBox(
                          width: 40,
                        ),
                        iconcreation(
                            Icons.person, Colors.blue ,"Contact"),
                      ],
                    ),
              SizedBox(
                width: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.payments, Colors.green,"Payment"),
            ],
          )

      ]
    ),
    ),
    ),
    );

  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 29,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text, style: TextStyle(
              fontSize: 12,
            ),
            ),
            // Text(text),
          ]
      ),
    );
  }


  Widget emojiSelect() {
    return EmojiPicker(
        rows: 4,
        columns: 7,
        onEmojiSelected: (emoji,category) {
          print(emoji);
          setState(() {
            _controller.text = _controller.text+ emoji.emoji;
          });
        }
    );
  }

}