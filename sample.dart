// -----used to import the dart I/O library-----
import 'dart:io';

// -----Task class-----
class Task {
  String description;
  bool isCompleted;
  Task(this.description, this.isCompleted);
}

// -----TaskManager class-----
class TaskManager {
// Methods for adding, viewing, updating, marking as completed and deleting tasks...
  List<Task> tasks = [];

  // -----Add a task-----
  void addTask(String description) {
    tasks.add(Task(description, false));
    print('Task added successfully.');
  }

  // -----view All the tasks-----
  void viewTasks() {
    if (tasks.isEmpty) {
      print('No tasks available.');
    } else {
      print('Tasks:');
      for (int i = 0; i < tasks.length; i++) {
        print(
            '${i + 1}. ${tasks[i].description} - ${tasks[i].isCompleted ? 'Completed' : 'Incomplete'}');
      }
    }
  }

  // -----Update task description-----
  void updateTask(int index, String newDescription) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].description = newDescription;
      print('Task updated successfully.');
    } else {
      print('Invalid task index.');
    }
  }

  // -----Mark task as complete-----
  void markTaskAsComplete(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].isCompleted = true;
      print('Task marked as complete.');
    } else {
      print('Invalid task index.');
    }
  }

  // -----Delete task-----
  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      print('Task deleted successfully.');
    } else {
      print('Invalid task index.');
    }
  }
}

// -----Main function-----
void main() {
  // Menu loop and user input handling...
  TaskManager taskManager = TaskManager();

// Display menu option...
  while (true) {
    print('\nMenu:');
    print('1. Add Task');
    print('2. View Tasks');
    print('3. Update Task');
    print('4. Mark Task as Complete');
    print('5. Delete Task');
    print('6. Exit');

    print('Enter your choice:');
    String? choice = stdin.readLineSync();

// Cases for different menu option...
    switch (choice) {
      case '1':
        print('Enter task description:');
        String? description = stdin.readLineSync();

        if (description != null && description.isNotEmpty) {
          taskManager.addTask(description);
        } else {
          print('Invalid task description.');
        }
        break;

      case '2':
        taskManager.viewTasks();
        break;

      case '3':
        print('Enter task index to update: ');
        // Handling valid input...
        int? index = int.tryParse(stdin.readLineSync() ?? '');

        if (index != null) {
          print('Enter new task description: ');
          String? newDescription = stdin.readLineSync();
          if (newDescription != null && newDescription.isNotEmpty) {
            taskManager.updateTask(index - 1, newDescription);
          } else {
            print('Invalid new task description.');
          }
        } else {
          print('Invalid task index.');
        }
        break;

      case '4':
        print('Enter task index to mark as complete: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');

        if (index != null) {
          taskManager.markTaskAsComplete(index - 1);
        } else {
          print('Invalid task index.');
        }
        break;

      case '5':
        print('Enter task index to delete: ');
        int? index = int.tryParse(stdin.readLineSync() ?? '');

        if (index != null) {
          taskManager.deleteTask(index - 1);
        } else {
          print('Invalid task index.');
        }
        break;

      case '6':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please enter a number from 1 to 6.');
    }
  }
}
//--------------------Exiting--------------------