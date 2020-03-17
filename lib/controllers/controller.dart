import 'package:mobx/mobx.dart';
import 'package:projetomedia/models/form.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  

  var form = FormState();

  
  validateNota(){
    if(form.nota1.toString().contains(',') ||
     form.nota2.toString().contains(',') ||
      form.nota3.toString().contains(',') ||
       form.nota4.toString().contains(',')){
         return "Nota invalida utilize '.'";
    }
  }
}