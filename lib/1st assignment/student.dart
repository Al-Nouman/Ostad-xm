import 'main.dart';

class Student extends Person {
  String studentID;
  String grade;
  List<double> courseScores;

  Student(String name, int age, String address, this.studentID, this.grade,
      this.courseScores)
      : super(name, age, address);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAverageScore() {
    double total = courseScores.reduce((a, b) => a + b);
    return total / courseScores.length;
  }

  void studentManagementSystem() {
    print("Student Information:");
    displayRole();
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
    print("Average Score: ${calculateAverageScore().toStringAsFixed(1)}");
  }
}

void main() {
  Student info =
      Student("John Doe", 20, "123 Main St", "S123", "A", [90, 85, 82]);
  info.studentManagementSystem();
}
