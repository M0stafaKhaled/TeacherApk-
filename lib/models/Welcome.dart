class Welcome {
   late int id ;
  late String name ;
  late String image ;
  late String gameName;
  late int score ;


  Welcome(this.id, this.name,this.image,this.gameName,this.score);
   Welcome.fromJson(Map<String, dynamic> map){
     id = map['id'];
     name=map['name'];
     image=map['image'];
     gameName=map['gameName'];
     score=map["score"];

   }

}