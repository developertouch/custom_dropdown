



import 'package:flutter/material.dart';

class custom_dropdown extends StatefulWidget {
  const custom_dropdown({super.key});

  @override
  State<custom_dropdown> createState() => _custom_dropdownState();
}

class _custom_dropdownState extends State<custom_dropdown> {
  // declare height variable for animated container
  double height = 150;
  double bottomHeight = 140;
  double width = 400;
  double truns = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedContainer(
          decoration: BoxDecoration(
            // color: Colors.red
          ),
          duration: Duration(milliseconds: 200),
          height: height,
          width: width,
          child: Stack(
            children: [
              //   container that hold the list of items
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: bottomHeight,
                width: 390,
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                    //   call the item that display after clicking the arrow_Downward button
                      SizedBox(height: 160,),
                      hover_affect(text: "Youtube"),
                      SizedBox(height: 5,),
                      hover_affect(text: "facebook"),
                      SizedBox(height: 5,),
                      hover_affect(text: "twitter"),
                      SizedBox(height: 5,),
                      hover_affect(text: "github"),
                      SizedBox(height: 5,),
                      hover_affect(text: "linkedin"),



                    ],
                  ),
                ),
              ),
              //   Container that hold the main profile section
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                height: 140,
                width: 390,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xff53d7e8)

                  // color: Colors.cyanAccent
                ),

                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("images/1.jpg"),
                          radius: 40,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Ishtiaq Rashid",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                "Flutter developer",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //   for bottom to expend /or collips the list
              Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      setState(() {
                        height = height==150 ? 400 :150; //this mean that when we click the the arrow the height will expand form 150 to 400 otherwise it will remain the same 150
                        truns=truns == 0.5 ? 1 :0.5 ; //this mean that when click on the arrow i move down so change it to opposite direction otherwise leave at it is same
                        bottomHeight= bottomHeight==140 ? 400 : 140; //
                      });


                    },
                    child: AnimatedRotation(
                      turns: truns,
                      duration: Duration(milliseconds: 300),
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black),
                        child: Icon(
                          Icons.arrow_downward,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

// widget that hold the hover animation for the text and its  background

class hover_affect extends StatefulWidget {
  final String text;

  const hover_affect({super.key, required this.text});

  @override
  State<hover_affect> createState() => _hover_affectState();
}

class _hover_affectState extends State<hover_affect> {
  Color? hoverColor;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event){
        // change color on hover
        setState(() {
          hoverColor= Color(0xff53d7e8);
          textColor = Colors.white;
        });
      },
      onExit: (event){
        // reversed color when not hovering
        setState(() {
          hoverColor= Colors.white;
          textColor= Colors.black;
        });
      },

      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: hoverColor,
        ),
        duration: Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        // color: hoverColor,
        child: Text(
          widget.text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
