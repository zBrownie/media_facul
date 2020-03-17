import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:oktoast/oktoast.dart';
import 'package:projetomedia/controllers/controller.dart';
import 'package:projetomedia/dbsql/media.dart';
import 'package:projetomedia/dbsql/service_media.dart';
import 'package:projetomedia/views/List_Medias.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Controller();
  Future<List<Media>> future;
  int id;

  final materiaControler = TextEditingController();
  final nota1Controler = TextEditingController();
  final nota2Controler = TextEditingController();

  Size get size => MediaQuery.of(context).size;

  @override
  void initState() {
    future = ServiceMedia.getAllTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Facul'),
        backgroundColor: Color(0xFF004731),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.library_books),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ListMedias()));
              })
        ],
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Observer(builder: (_) {
                  return Text(
                    controller.showMedia
                        ? 'Media: ${controller.form.notas}'
                        : 'Media:',
                    style: TextStyle(fontSize: 20),
                  );
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _textField(
                      hintText: 'Nome Materia',
                      controller: materiaControler,
                      keyboardType: TextInputType.text,
                      onChanged: controller.form.changeNomeMateria,
                      fieldClear: () {
                        materiaControler.clear();
                        controller.form.changeNomeMateria('');
                      },
                      errorText: controller.valideNomeMateria);
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _textField(
                      hintText: 'Nota 1',
                      controller: nota1Controler,
                      keyboardType: TextInputType.number,
                      onChanged: controller.form.changeNota1,
                      fieldClear: () {
                        nota1Controler.clear();
                        controller.form.changeNota1('');
                      },
                      errorText: controller.valideNota1);
                }),
                SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return _textField(
                      hintText: 'Nota 2',
                      controller: nota2Controler,
                      keyboardType: TextInputType.number,
                      onChanged: controller.form.changeNota2,
                      fieldClear: () {
                        nota2Controler.clear();
                        controller.form.changeNota2('');
                      },
                      errorText: controller.valideNota2);
                }),
                SizedBox(
                  height: 40,
                ),
                // Observer(
                // builder: (_){
                // return _textField(
                //   hintText: 'Nota 3',
                //   onChanged: controller.form.changeNota3,
                //   errorText: controller.valideNota
                //   );
                // }),
                // Observer(
                // builder: (_){
                // return _textField(
                //   hintText: 'Nota 4',
                //   onChanged: controller.form.changeNota4,
                //   errorText: controller.valideNota
                //   );
                // }),

                Observer(builder: (_) {
                  return Container(
                    width: size.width * 0.8,
                    height: 46,
                                      child: RaisedButton(
                      child: Text('Salvar'),
                      elevation: 4,
                      color: Color(0xFF004731),
                      textColor: Colors.white,
                      onPressed: controller.isValid ? _createMedia : null,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  //WIDGETS
  TextField _textField({
    String hintText,
    controller,
    onChanged,
    TextInputType keyboardType,
    Function() errorText,
    Function() fieldClear,
  }) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hintText,
          labelText: hintText,
          errorText: errorText == null ? null : errorText(),
          suffixIcon:
              IconButton(icon: Icon(Icons.clear), onPressed: fieldClear)),
      onChanged: onChanged,
      controller: controller,
    );
  }

  _createMedia() async {
    int count = await ServiceMedia.mediasCount();
    final media = Media(
        count,
        controller.form.nomeMateria,
        controller.form.notas,
        double.parse(controller.form.nota1),
        double.parse(controller.form.nota2),
        false);

    await ServiceMedia.addMedia(media).then((_) {
      toastFlutter(controller.form.nomeMateria);
      Future.delayed(Duration(seconds: 1)).then((_) {
        controller.form.changeNomeMateria('');
        controller.form.changeNota1('');
        controller.form.changeNota2('');
        materiaControler.clear();
        nota1Controler.clear();
        nota2Controler.clear();
      });
    });
  }

  toastFlutter(String nomeMateria) {
    return showToast('Salvando $nomeMateria',
        duration: Duration(seconds: 1),
        position: ToastPosition.top,
        backgroundColor: Color(0xFF004731).withOpacity(0.8),
        radius: 2,
        textStyle: TextStyle(fontSize: 22.0));
  }
}
