import 'package:flutter/material.dart';
import 'package:pazzal_game/data.dart';
import 'package:pazzal_game/page_1_conu.dart';
import 'package:pazzal_game/page_1_puzz_page_2.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class page_1_puzz extends StatefulWidget {
  int cur_index;
  List list = [];
  List<bool>l=[];//gester and dector pending


  page_1_puzz(this.cur_index, this.list);

  @override
  State<page_1_puzz> createState() => _page_1_puzzState();
}

class _page_1_puzzState extends State<page_1_puzz> {

  SharedPreferences ?prefs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.list);
    print(widget.cur_index);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.jpg'), fit: BoxFit.fill),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 100,
                width: 500,
                child: Center(
                  child: Text(
                    "Select Puzzle",
                    style: TextStyle(
                        fontFamily: "f1",
                        color: Color(0xff3f51b5),
                        fontWeight: FontWeight.bold,
                        fontSize: 40),
                  ),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: data.no_of_puzzle.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if(widget.cur_index>=index)
                            {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return page_1_conu(index);
                                },
                              ));
                            }
                        });

                      },
                      child: Container(
                        height: 15,
                        width: 15,
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        child: (widget.cur_index >= index)
                            ? Text(
                                textAlign: TextAlign.center,
                                "${index + 1}",
                                style: TextStyle(
                                    fontFamily: "f1",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.blue),
                              )
                            : null,
                        decoration: BoxDecoration(
                            image: (index<=widget.cur_index)
                                ? (widget.list[index] == "win")
                                    ? DecorationImage(
                                        image: AssetImage("images/tick.png"))
                                    : null
                                : DecorationImage(
                                    image: AssetImage("images/lock.png")),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black38,
                                width: 2)),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start  ,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return pazzal_game();
                  },
                ));
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage("images/back.png"))),
              ),

            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return page_1_puzz_page_2(widget.cur_index, widget.list);
                  },
                ));
              },
              child: Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(left: 200),

                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("images/next.png"))),
              ),
            ),

          ],
        )
      ]),
    ));
  }
}
