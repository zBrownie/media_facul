import 'package:mobx/mobx.dart';
part 'form.g.dart';

class FormState = _FormStateBase with _$FormState;

abstract class _FormStateBase with Store {
  
  @observable
  String nomeMateria = '';

  @action
  changeNomeMateria(String newValue)=> nomeMateria= newValue;


  @observable
  String nota1='';

  @action
  changeNota1(String newValue)=> nota1= newValue;

  @observable
  String nota2='';

  @action
  changeNota2(String newValue)=> nota2= newValue;
  @observable
  String nota3='';

  @action
  changeNota3(String newValue)=> nota3= newValue;
  
  @observable
  String nota4='';

  @action
  changeNota4(String newValue)=> nota4= newValue;

  @computed
  double get notas => ( double.parse(nota1)+double.parse(nota2) ) / 2;
}
  