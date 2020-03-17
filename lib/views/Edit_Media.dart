import 'package:flutter/material.dart';
import 'package:projetomedia/dbsql/media.dart';
import 'package:projetomedia/dbsql/service_media.dart';

class EditMedias extends StatefulWidget {
  Media media;

  EditMedias(this.media);
  
  @override
  _EditMediasState createState() => _EditMediasState();
}

class _EditMediasState extends State<EditMedias> {

  Size get size => MediaQuery.of(context).size;

  updateMedia(Media media) async {
    media.materia = 'nova materia';
    await ServiceMedia.updateMedia(media);
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.8,
      child: Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.close), onPressed: (){
              Navigator.of(context).pop();
            }),
          ],
        ),
      ),
    );
  }
}