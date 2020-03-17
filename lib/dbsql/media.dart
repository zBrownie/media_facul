import 'package:projetomedia/dbsql/database_creator.dart';

class Media{
  int id;
  String materia;
  double nota1;
  double nota2;
  double media;
  bool isDeleted;


Media(this.id,this.materia,this.media,this.nota1,this.nota2,this.isDeleted);

Media.fromJson(Map<String,dynamic> json){
  this.id = json[DataBaseCreator.id];
  this.materia  = json[DataBaseCreator.materia];
  this.nota1 = json[DataBaseCreator.nota1];
  this.nota2 = json[DataBaseCreator.nota2];
  this.media = json[DataBaseCreator.media];
  this.isDeleted = json[DataBaseCreator.isDeleted]== 1; 
}

}