import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher/models/Welcome.dart';
import 'package:teacher/models/fetchApi.dart';

class Score extends StatefulWidget {


   Score( {Key? key }) : super(key: key);


  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  _ScoreState();
  Future refresh() async{
    setState(() {

      // fe   = fetchApi().fetchScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    fetchApi fe = fetchApi() ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFD5C59),
        automaticallyImplyLeading: false,
        // leading: Icon(Icons.arrow_back),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
         // IconButton(onPressed: (){}, icon: Icon(Icons.person_add)),
        ],
        title:const  Text(
          "Score Board",
          style: TextStyle(fontSize: 27),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: RefreshIndicator(
        onRefresh: refresh,
        child: SingleChildScrollView(

          child: Column(
            children: [

              Container(
                padding: EdgeInsets.only(top : 30),
                height: 330,
                decoration: BoxDecoration(
                    color: Color(0xffFD5C54),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                          radius: 50,
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(shape: BoxShape.circle ,color: Colors.white),child: Icon(Icons.local_fire_department,color: Colors.purpleAccent[800],),),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Mostafa",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "15",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            Text("Level",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: [
                            Text("#335",
                                style: TextStyle(
                                    fontSize: 42,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.9))),
                            Text("Rank",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Leaderboard",
                style: TextStyle(fontSize: 20),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  child: FutureBuilder(
                    future: fe.fetchScore(),
                    builder:
                    (contesxt,snapshot) {
                      List<Welcome>? welcomes = snapshot.data as List<Welcome>  ;
                      return ListView.builder(
                        itemCount:welcomes.length ,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      welcomes[index].image),
                                ),
                                SizedBox(
                                  width: 1,
                                ),
                                Flexible(child: Text(welcomes[index].name , maxLines: 1, overflow: TextOverflow.ellipsis,))
                              ],
                            ),
                            leading: Text("#${index + 1}",
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            trailing: Text(welcomes[index].score.toString()


                            ,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          );
                        },
                      );
                    }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}