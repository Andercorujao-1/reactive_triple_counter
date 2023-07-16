import 'package:tests/reactive_int.dart';

class CounterController {
  ReactiveInt a= ReactiveInt();
  ReactiveInt b= ReactiveInt();
  ReactiveInt c= ReactiveInt();
  int counterListeners = 0;
  //em reactiveint, a lista de listeners é salva em um map, com a
  // key=counterlisteners, essa é uma forma de numerar os listeners, depois isso
  //é usado pra evitar de avisar 1 listener mais de 1 vez no mesmo método

  int getA(void Function()? attState){
    if (attState!=null){
    a.addListener(counterListeners, attState);
    counterListeners++;
    }
    return a.value;
  }

  int getAB(void Function()? attState){
    if (attState!=null){
      a.addListener(counterListeners, attState);
      b.addListener(counterListeners, attState);
      counterListeners++;
    }
    return a.value+b.value;
  }

  int getABC(void Function()? attState){
    if (attState!=null){
      a.addListener(counterListeners, attState);
      b.addListener(counterListeners, attState);
      c.addListener(counterListeners, attState);
      counterListeners++;
    }
    return a.value+b.value+c.value;
  }

  void incrementABC(){
    a.value++;
    b.value++;
    c.value++;
    Map<int,Function> mergedMap = {...a.returnListeners(), ...b.returnListeners(), ...c.returnListeners() };
    //aqui os mapas são fundidos para que as keys repetidas sejam sobrescritas
    //key repetida significa mesmo listener escutando mais de 1 variavel
    ReactiveInt.notifyListeners(mergedMap);
  }

  void incrementBC(){
    b.value++;
    c.value++;
    Map<int,Function> mergedMap = {...c.returnListeners(), ...b.returnListeners()};
    ReactiveInt.notifyListeners(mergedMap);
  }

  void incrementC(){
    c.value++;
    ReactiveInt.notifyListeners(c.returnListeners());
  }
}