
import 'package:flutter/material.dart';
import 'package:teacher/models/Welcome.dart';
import 'package:teacher/models/fetchApi.dart';

class second extends StatefulWidget {
  const second({Key? key}) : super(key: key);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  fetchApi fe = fetchApi();


  Future refresh() async{
      setState(() {

        fe.fetchScore() ;
      });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Score"),
        ),

      body: RefreshIndicator(
        onRefresh: refresh,
        child: FutureBuilder(
          future: fe.fetchScore(),
            builder:
                (contesxt,snapshot){
            List<Welcome> welcomes =  snapshot.data as List<Welcome>;
              return ListView.builder(
                  itemCount: welcomes.length,
                  itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(children: [

                        Expanded(child: Text(welcomes[index].name)),


                        Expanded(child: Text(welcomes[index].score.toString())),
                      ],),
                    ],
                  ),
                );
                  });


        }),
      )
    );
  }
}
