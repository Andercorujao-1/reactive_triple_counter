import 'counter_implementations.dart';

class PageCounterActions {
  CounterController controller = CounterController();

  int getA(void Function()? attState)=>controller.getA(attState);
  int getAB(void Function()? attState)=>controller.getAB(attState);
  int getABC(void Function()? attState)=>controller.getABC(attState);
  void incrementABC (){controller.incrementABC();}
  void incrementBC (){controller.incrementBC();}
  void incrementC (){controller.incrementC();}

}