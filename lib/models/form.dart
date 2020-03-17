import 'package:mobx/mobx.dart';
part 'form.g.dart';

class FormState = _FormStateBase with _$FormState;

abstract class _FormStateBase with Store {
  
  @observable
  int nota1;

  @action
  changeNota1(newValue)=> nota1= newValue;

  @observable
  int nota2;

  @action
  changeNota2(newValue)=> nota2= newValue;
  @observable
  int nota3;

  @action
  changeNota3(newValue)=> nota3= newValue;
  
  @observable
  int nota4;

  @action
  changeNota4(newValue)=> nota4= newValue;
}
  