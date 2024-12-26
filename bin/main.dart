abstract class Role{
  void displayRole();
}

class Person implements Role{
  final String _name;
  final int _age;
  final String _address;

  @override
  void displayRole() {
    print("unidentified");
  }

  Person(this._name,this._age,this._address);

  String get name => _name;
  int get age => _age;
  String get address => _address;

  void displayInformation(){
    print("Name: $name\nAge: $age\nAddress: $address\n");
  }
}

class Student extends Person{
  String ? studentID;
  String ? grade;
  List courseScores;

  Student(this.studentID,String sName,int sAge,String sAddress,this.grade,this.courseScores):
        super(sName,sAge,sAddress);

  @override
  void displayRole() {
    print("Role: Student");
  }

  double calculateAvgScore() {
    double sum = 0;
    double avg = 0;
    for(var score in courseScores) {
      sum += score;
    }
    avg = sum / courseScores.length;
    return avg;
  }

  @override
  void displayInformation(){
    print("Name: $name\nAge: $age\nAddress: $address\nAverage Score: ${calculateAvgScore().toStringAsFixed(1)}\n\n");
  }
}

class Teacher extends Person{
  String ? teacherID;
  List arrayList;

  Teacher(this.teacherID,String tName,int tAge,String tAddress,this.arrayList):
        super(tName,tAge,tAddress);

  @override
  void displayRole() {
    print("Role: Teacher");
  }

  void courseTaught(){
    for(var course in arrayList){
      print("- $course");
    }
  }

  @override
  void displayInformation(){
    print("Name: $name\nAge: $age\nAddress: $address\nCourse Taught: ");
    courseTaught();
  }
}

class StudentManagementSystem{
  start(){
    Student student1 = Student("", "John Doe", 20, "123 Main St", "", [90,85,82]);
    print("Student Information:\n");
    student1.displayRole();
    student1.displayInformation();

    Teacher teacher1 = Teacher("", "Mrs. Smith", 35, "456 Oak St", ['Math','English','Bangla']);
    print("Teacher Information:\n");
    teacher1.displayRole();
    teacher1.displayInformation();
  }
}

main(){
  StudentManagementSystem studentManagementSystem = StudentManagementSystem();
  studentManagementSystem.start();
}