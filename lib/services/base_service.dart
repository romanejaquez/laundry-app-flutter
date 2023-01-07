abstract class BaseService {

  void resetAll();
  bool selectionsMade();
  void notifyBaseListeners(Function callback);
  Function? callback;
}