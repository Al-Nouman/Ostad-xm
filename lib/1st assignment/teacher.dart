import 'main.dart';

class Teacher extends Person {
  String teacherID;
  List<String> coursesTaught;

  Teacher(
      String name, int age, String address, this.teacherID, this.coursesTaught)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void displayCourses() {
    print("Courses Taught:");
    for (String course in coursesTaught) {
      print("- $course");
    }
  }

  void teacherManagementSystem() {
    print("Teacher Information:");
    displayRole();
    print("Name: $getName");
    print("Age: $getAge");
    print("Address: $getAddress");
  }
}

main() {
  Teacher info = Teacher(
      "Mrs. Smith", 35, "456 Oak St", "T456", ["Math", "English", "Bangla"]);
  info.teacherManagementSystem();
  info.displayCourses();
}
