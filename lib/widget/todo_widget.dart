import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sherpa_app/models/todo.dart';
import 'package:sherpa_app/Pages/edit_todo_page.dart';
import 'package:sherpa_app/provider/todos.dart';
import 'package:sherpa_app/utils.dart';
import 'package:table_calendar/table_calendar.dart';

/*class TodoWidget extends StatelessWidget {

  final Todo todo;

  const TodoWidget({
    @required this.todo,
    Key key,
  }) : super(key: key);
 */
class TodoWidget extends StatefulWidget {
  TodoWidget({this.todo, Key? key,}) : super(key: key);
  final Todo? todo;
  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}
//${widget.info}')

class _TodoWidgetState extends State<TodoWidget> {
  //CALENDAR STUFF
  //final CalendarController _calendarController = CalendarController();
  //DateTime _focusedDay = DateTime.now();


  @override
  Widget build(BuildContext context) => ClipRRect(

        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(widget.todo!.id!),
          actions: [
            IconSlideAction(
              color: Colors.green,
              onTap: () => editTodo(context, widget.todo),
              caption: 'Edit',
              icon: Icons.edit,
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              onTap: () => deleteTodo(context, widget.todo!),
              icon: Icons.delete,
            )
          ],

          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) => GestureDetector(

        onTap: () => editTodo(context, widget.todo),
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              /*Checkbox(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
                value: todo.isDone,
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
                  final isDone = provider.toggleTodoStatus(todo);

                  Utils.showSnackBar(
                    context,
                    isDone ? 'Task completed' : 'Task marked incomplete',
                  );
                },
              ),*/
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.todo!.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                      ),
                    ),
                    /*if (todo.description.isNotEmpty) //DECRIPTION
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        child: Text(
                          todo.description,
                          style: TextStyle(fontSize: 20, height: 1.5),
                        ),
                      )*/

                    //SIITSIIT
                   /* Card(
                      clipBehavior: Clip.antiAlias,
                      margin: const EdgeInsets.all(0.0),
                    child : TableCalendar(

                    ),
                    ),*/


                  ],
                ),
              ),
            ],
          ),
        ),
      );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo? todo) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EditTodoPage(todo: todo),
        ),
      );
}
