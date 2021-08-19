import 'package:ignite_flutter_todo_list/gerencia_de_estado.dart';
import 'package:ignite_flutter_todo_list/shared/models/todo_item.dart';

class HomeController {
  final _toDoItemList = <ToDoItem>[];
  final _doneItemList = <ToDoItem>[];

  int get toDoitemListLength => _toDoItemList.length;

  int get doneItemListlength => _doneItemList.length;

  final listTaskPending = GerenciaDeEstado<List<ToDoItem>>(initialState: []);
  final listTaskConcluded = GerenciaDeEstado<List<ToDoItem>>(initialState: []);

  void onAddItem(String itemTitle) {
    _toDoItemList.add(
      ToDoItem(
        title: itemTitle,
      ),
    );
    listTaskPending.setState(_toDoItemList);
  }

  void onRemoveToDoItem(ToDoItem item) {
    _toDoItemList.remove(item);
    listTaskPending.setState(_toDoItemList);
  }

  void onCompleteItem(ToDoItem item) {
    _toDoItemList.remove(item);
    listTaskPending.setState(_toDoItemList);
    _doneItemList.add(
      ToDoItem(
        title: item.title,
        isDone: true,
      ),
    );
    listTaskConcluded.setState(_doneItemList);
  }

  void onRemoveDoneItem(ToDoItem item) {
    _doneItemList.remove(item);
    listTaskConcluded.setState(_doneItemList);
  }

  void onResetItem(ToDoItem item) {
    _doneItemList.remove(item);
    listTaskConcluded.setState(_doneItemList);
    _toDoItemList.add(
      ToDoItem(
        title: item.title,
      ),
    );
    listTaskPending.setState(_toDoItemList);
  }
}
