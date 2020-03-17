import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projetomedia/controllers/controller.dart';
import 'package:projetomedia/dbsql/media.dart';
import 'package:projetomedia/dbsql/service_media.dart';

class ListMedias extends StatefulWidget {
  @override
  _ListMediasState createState() => _ListMediasState();
}

class _ListMediasState extends State<ListMedias> {
  Future<List<Media>> future;
  int id;
  Future<int> count;
  // String materia;

  Size get size => MediaQuery.of(context).size;

  final materiaControler = TextEditingController();
  final nota1Controler = TextEditingController();
  final nota2Controler = TextEditingController();

  final controller = Controller();
  @override
  void initState() {
    future = ServiceMedia.getAllTodos();
    count = ServiceMedia.mediasCount();
    super.initState();
  }

  readData() async {
    final todo = await ServiceMedia.getMedia(id);

    return todo;
  }

  updateMedia(Media media) async {
    media.materia = 'nova materia';
    await ServiceMedia.updateMedia(media);
  }

  deleteMedia(Media media) async {
    await ServiceMedia.deleteMedia(media);
    setState(() {
      id = null;
      future = ServiceMedia.getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medias'),
        centerTitle: true,
        backgroundColor: Color(0xFF004731),
      ),
      body: FutureBuilder<List<Media>>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Media>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    isThreeLine: true,
                    title: Text(
                        '${snapshot.data[index].materia} \n Media : ${snapshot.data[index].media}'),
                    subtitle: Text(
                        'Notas: ${snapshot.data[index].nota1} / ${snapshot.data[index].nota2}'),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // IconButton(
                          //     icon: Icon(Icons.edit, color: Colors.black),
                          //     onPressed: () => showModal(snapshot.data[index])),
                          IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red.withOpacity(0.7),
                              ),
                              onPressed: () =>
                                  checkDelete(snapshot.data[index])),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  checkDelete(Media media) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(media.materia),
            content: Text('Tem Certeza deseja deletar?'),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  deleteMedia(media);
                  Navigator.of(context).pop();
                },
                color: Colors.red.withOpacity(0.8),
                elevation: 0,
                child: Text('Deletar'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                elevation: 0,
                color: Colors.blueAccent,
                child: Text('Voltar'),
              )
            ],
          );
        });
  }
  // showModal(Media media) {
  //   controller.form.nota1 = '${media.nota1}';
  //   controller.form.nota2 = '${media.nota2}';
  //   controller.form.nomeMateria = media.materia;

  //   nota1Controler.value = new TextEditingController.fromValue(
  //           new TextEditingValue(text: "${media.nota1}"))
  //       .value;
  //   nota2Controler.value = new TextEditingController.fromValue(
  //           new TextEditingValue(text: "${media.nota2}"))
  //       .value;

  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //           height: size.height * 0.5,
  //           child: AlertDialog(
  //             content: Padding(
  //               padding: const EdgeInsets.all(12.0),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: <Widget>[
  //                     // Container(
  //                     //   alignment: Alignment.topRight,
  //                     //   child: IconButton(
  //                     //       icon: Icon(Icons.close), onPressed: () {}),
  //                     // ),
  //                     Observer(builder: (_) {
  //                       return _textField(
  //                           hintText: 'Nota 1',
  //                           controller: nota1Controler,
  //                           keyboardType: TextInputType.number,
  //                           onChanged: controller.form.changeNota1,
  //                           fieldClear: () {
  //                             nota1Controler.clear();
  //                             controller.form.changeNota1('');
  //                           },
  //                           errorText: controller.valideNota1);
  //                     }),
  //                     SizedBox(
  //                       height: 20,
  //                     ),
  //                     Observer(builder: (_) {
  //                       return _textField(
  //                           hintText: 'Nota 2',
  //                           controller: nota2Controler,
  //                           keyboardType: TextInputType.number,
  //                           onChanged: controller.form.changeNota2,
  //                           fieldClear: () {
  //                             nota2Controler.clear();
  //                             controller.form.changeNota2('');
  //                           },
  //                           errorText: controller.valideNota2);
  //                     }),
  //                     SizedBox(
  //                       height: 30,
  //                     ),
  //                     Observer(builder: (_) {
  //                       return RaisedButton(
  //                         child: Text('Salvar'),
  //                         elevation: 4,
  //                         color: Color(0xFF004731),
  //                         textColor: Colors.white,
  //                         onPressed: controller.showMedia
  //                             ? () {
  //                                 media.nota1 =
  //                                     double.parse(controller.form.nota1);
  //                                 media.nota2 =
  //                                     double.parse(controller.form.nota2);

  //                                 updateMedia(media);
  //                               }
  //                             : null,
  //                       );
  //                     })
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  // }

  // TextField _textField({
  //   String hintText,
  //   controller,
  //   onChanged,
  //   TextInputType keyboardType,
  //   Function() errorText,
  //   Function() fieldClear,
  // }) {
  //   return TextField(
  //     keyboardType: keyboardType,
  //     decoration: InputDecoration(
  //         border: OutlineInputBorder(),
  //         hintText: hintText,
  //         labelText: hintText,
  //         errorText: errorText == null ? null : errorText(),
  //         suffixIcon:
  //             IconButton(icon: Icon(Icons.clear), onPressed: fieldClear)),
  //     onChanged: onChanged,
  //     controller: controller,
  //   );
  // }
}
