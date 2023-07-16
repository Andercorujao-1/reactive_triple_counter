
class ReactiveInt{
  int value = 0;
  Map<int,Function> listeners = {};

  void addListener(int counter, void Function() attState){
    listeners.addAll({counter: attState});
  }

  Map<int,Function> returnListeners(){
    return listeners;
  }

  static void notifyListeners (Map<int,Function> lists){
    lists.forEach((key, value) {
      value();
    });
  }
}