import 'package:mobx/mobx.dart';
import 'package:projetomedia/models/form.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var form = FormState();

  String valideNota1() {
    if (form.nota1.isEmpty || form.nota1 == null) {
      return 'Insira Nota';
    } else if (form.nota1.contains(',')) {
      return 'Nota incorreta utilize ponto ( . )';
    }

    return null;
  }

  String valideNota2() {
    if (form.nota2.isEmpty || form.nota2 == null) {
      return 'Insira Nota';
    } else if (form.nota2.contains(',')) {
      return 'Nota incorreta utilize ponto ( . )';
    }

    return null;
  }

  String valideNomeMateria() {
    if (form.nomeMateria.isEmpty) {
      return 'Digite nome da matéria';
    } else if (form.nomeMateria.length <= 3) {
      return 'Poucos caracteres';
    }

    return null;
  }

  @computed
  bool get isValid {
    return valideNota1() == null &&
        valideNomeMateria() == null &&
        valideNota2() == null;
  }

  @computed
  bool get showMedia {
    return valideNota1() == null && valideNota2() == null;
  }
}
