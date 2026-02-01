import 'package:learnhub/models/program.dart';

class ProgramRepository {
  const ProgramRepository();

  Future<List<Program>> fetchPrograms() async {

    await Future.delayed(const Duration(milliseconds: 800));

    return [
      // PROGRAM 1: WEB DEVELOPMENT
      Program(
        id: 'p1',
        title: 'Web Development',
        description: 'Master the core technologies of the web: HTML, CSS, and JavaScript. Build responsive and interactive websites from scratch.',
        difficulty: 'Beginner',
        duration: '12 Weeks',

        // 1. VIDEOS (YouTube Links)
        videos: [
          VideoLesson(
              title: "HTML Full Course",
              videoUrl: "https://www.youtube.com/watch?v=kUMe1FH4CHE",
              duration: "2:00:00"
          ),
          VideoLesson(
              title: "CSS Crash Course",
              videoUrl: "https://www.youtube.com/watch?v=wRNinF7YQqQ",
              duration: "1:30:00"
          ),
          VideoLesson(
              title: "JavaScript for Beginners",
              videoUrl: "https://www.youtube.com/watch?v=hdI2bqOjy3c",
              duration: "3:00:00"
          ),
        ],

        // 2. NOTES (Detailed Content)
        notes: [
          // HTML NOTES
          NoteLesson(
            title: "1. HTML Fundamentals",
            content: """
## Introduction to HTML
HTML (HyperText Markup Language) is the standard markup language for documents designed to be displayed in a web browser.

## 1. Basic Structure
Every HTML document follows this structure:
<!DOCTYPE html>
<html>
  <head>
    <title>Page Title</title>
  </head>
  <body>
    <h1>My First Heading</h1>
    <p>My first paragraph.</p>
  </body>
</html>

## 2. Common Tags
- <h1> to <h6>: Headings (h1 is the largest).
- <p>: Paragraphs.
- <a>: Anchor tags for links (e.g., <a href="url">Link</a>).
- <img>: Images (e.g., <img src="image.jpg" alt="Description">).
- <ul> and <li>: Unordered (bulleted) lists.
- <div>: A container used to group elements for styling.

## 3. Semantic HTML
Semantic tags clearly describe their meaning to both the browser and the developer.
Examples: <header>, <footer>, <article>, <section>, <nav>.
Using these improves SEO and accessibility compared to using only <div> tags.
            """,
          ),

          // CSS NOTES
          NoteLesson(
            title: "2. Mastering CSS",
            content: """
# Introduction to CSS
CSS (Cascading Style Sheets) describes how HTML elements are to be displayed on screen, paper, or in other media.

## 1. Selectors
- Element Selector: p { color: red; } (Targets all <p> tags)
- ID Selector: #header { background: blue; } (Targets element with id="header")
- Class Selector: .btn { padding: 10px; } (Targets elements with class="btn")

## 2. The Box Model
Every element in CSS is a box. It consists of:
1. Content: The actual text or image.
2. Padding: Space around the content (inside the border).
3. Border: A border that goes around the padding.
4. Margin: Space outside the border (pushes other elements away).

## 3. Flexbox Layout
Flexbox is a one-dimensional layout method for laying out items in rows or columns.
- display: flex; (Turns a container into a flexbox)
- justify-content: center; (Aligns items horizontally)
- align-items: center; (Aligns items vertically)
            """,
          ),

          // JAVASCRIPT NOTES
          NoteLesson(
            title: "3. JavaScript Basics",
            content: """
# Introduction to JavaScript
JavaScript is the programming language of the Web. It allows you to add interactivity, logic, and dynamic behavior to websites.

## 1. Variables
There are three ways to declare variables:
- var: The old way (function scoped). Avoid using this.
- let: The modern way (block scoped). Use this for values that change.
- const: Block scoped. Use this for values that will NOT change.

Example:
let score = 10;
const name = "LearnHub";

## 2. Functions
Functions are blocks of code designed to perform a particular task.

// Arrow Function Syntax
const sayHello = (name) => {
  return "Hello " + name;
}

## 3. DOM Manipulation
The DOM (Document Object Model) allows JS to change HTML content.
- document.getElementById('demo').innerHTML = "Hello World";
- document.querySelector('.btn').addEventListener('click', myFunction);

## 4. Conditionals
if (score > 50) {
  console.log("You passed!");
} else {
  console.log("Try again.");
}
            """,
          ),
        ],

        // REAL QUIZ DATA
        quizzes: [
          QuizLesson(
            title: "HTML & CSS Basics",
            questions: [
              Question(
                questionText: "What does HTML stand for?",
                options: ["Hyper Text Markup Language", "Home Tool Markup Language", "Hyperlinks and Text Markup Language"],
                correctAnswerIndex: 0,
              ),
              Question(
                questionText: "Which HTML tag is used to define an internal style sheet?",
                options: ["<script>", "<style>", "<css>"],
                correctAnswerIndex: 1,
              ),
              Question(
                questionText: "Which property is used to change the background color?",
                options: ["color", "bgcolor", "background-color"],
                correctAnswerIndex: 2,
              ),
            ],
          ),
        ],
      ),

      // PROGRAM 2: APP DEVELOPMENT
      Program(
        id: 'p2',
        title: 'App Development',
        description: 'Build native mobile apps for iOS and Android using Flutter and Dart.',
        difficulty: 'Intermediate',
        duration: '16 Weeks',

        // 1. VIDEOS (YouTube Links)
        videos: [
          VideoLesson(
              title: "Dart Full Course",
              videoUrl: "https://www.youtube.com/watch?v=Ej_Pcr4uC2Q",
              duration: "4:00:00"
          ),
          VideoLesson(
              title: "Flutter Crash Course",
              videoUrl: "https://www.youtube.com/watch?v=x0uinJvhNxI",
              duration: "1:15:00"
          ),
          VideoLesson(
              title: "Building Your First App",
              videoUrl: "https://www.youtube.com/watch?v=1gDhl4leEzA",
              duration: "45:00"
          ),
        ],

        // 2. NOTES (Detailed Dart Content)
        notes: [
          // CHAPTER 1: DART BASICS
          NoteLesson(
            title: "1. Dart Language Basics",
            content: """
# Introduction to Dart
Dart is a client-optimized language for fast apps on any platform. It is the language used to build Flutter apps.

## 1. Variables and Data Types
Dart is strongly typed.
- int: Integers (e.g., int age = 25;)
- double: Decimals (e.g., double price = 9.99;)
- String: Text (e.g., String name = 'LearnHub';)
- bool: Boolean (e.g., bool isDone = false;)
- dynamic: Can change type (Avoid using if possible).

## 2. Variables: var, final, const
- var: Dart infers the type automatically.
  var name = 'John'; // Dart knows this is a String.

- final: Variable can only be set once.
  final time = DateTime.now(); // Runtime constant.

- const: Compile-time constant.
  const pi = 3.14;

## 3. Control Flow
Standard if-else and loops work just like C or Java.
for (var i = 0; i < 5; i++) {
  print('Index: \$i');
}
            """,
          ),

          // CHAPTER 2: OOP IN DART
          NoteLesson(
            title: "2. OOP in Dart",
            content: """
# Object-Oriented Programming
Dart is an object-oriented language with classes and mixin-based inheritance.

## 1. Classes and Objects
Class is a blueprint for creating objects.

class Student {
  String name;
  int age;

  // Constructor
  Student(this.name, this.age);

  void study() {
    print('\$name is studying.');
  }
}

void main() {
  var s1 = Student('Ali', 22);
  s1.study();
}

## 2. Null Safety
Dart has sound null safety. Variables cannot be null unless you say so.
- String? name; // This can be null.
- String name;  // This CANNOT be null.

## 3. Inheritance
Use 'extends' to create a subclass.
class Car extends Vehicle { ... }
            """,
          ),

          // CHAPTER 3: FLUTTER BASICS
          NoteLesson(
            title: "3. Flutter Widgets",
            content: """
# Introduction to Widgets
In Flutter, everything is a Widget.

## 1. Stateless vs Stateful
- StatelessWidget: Immutable. The UI does not change once built (e.g., Text, Icon).
- StatefulWidget: Mutable. The UI can change when the state changes (e.g., Checkbox, Counter).

## 2. Common Layout Widgets
- Column: Arranges children vertically.
- Row: Arranges children horizontally.
- Container: A box with padding, margin, and borders.
- Scaffold: Implements the basic material design layout (AppBar, FloatingActionButton).

## 3. The build() Method
Every widget has a build method that returns the widget tree.
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Hello')),
    body: Center(child: Text('Welcome!')),
  );
}
            """,
          ),
        ],

        // REAL QUIZ DATA
        quizzes: [
          QuizLesson(
            title: "Dart Fundamentals",
            questions: [
              Question(
                questionText: "Which keyword is used to define a constant variable?",
                options: ["var", "let", "const"],
                correctAnswerIndex: 2,
              ),
              Question(
                questionText: "Is Dart an Object-Oriented language?",
                options: ["Yes", "No", "Partially"],
                correctAnswerIndex: 0,
              ),
            ],
          ),
        ],
      ),
      // PROGRAM 3: DATA SCIENCE WITH PYTHON
      Program(
        id: 'p3',
        title: 'Data Science with Python',
        description: 'Learn to analyze data, create visualizations, and build machine learning models using Python.',
        difficulty: 'Advanced',
        duration: '14 Weeks',

        // 1. VIDEOS
        videos: [
          VideoLesson(
              title: "Python for Data Science",
              videoUrl: "https://www.youtube.com/watch?v=LHBE6Q9XlzI",
              duration: "12:00:00"
          ),
          VideoLesson(
              title: "Pandas & NumPy Tutorial",
              videoUrl: "https://www.youtube.com/watch?v=vmEHCJofslg",
              duration: "1:00:00"
          ),
        ],

        // 2. NOTES
        notes: [
          NoteLesson(
            title: "1. Python Libraries",
            content: """
# Key Data Science Libraries
Python is the leading language for data science because of its rich ecosystem of libraries.

## 1. NumPy (Numerical Python)
Used for working with arrays. It creates the foundation for higher-level tools.
- Fast mathematical operations.
- Support for multi-dimensional arrays and matrices.

## 2. Pandas
Used for data manipulation and analysis.
- DataFrame: A table with rows and columns (like Excel).
- Series: A single column of data.
- Functions: `df.head()`, `df.describe()`, `df.plot()`.

## 3. Matplotlib & Seaborn
Used for data visualization.
- Matplotlib: Low-level, highly customizable plots.
- Seaborn: High-level interface for drawing attractive statistical graphics.
            """,
          ),
          NoteLesson(
            title: "2. The Data Analysis Process",
            content: """
# 5 Steps of Data Analysis

1. **Ask**: Define the problem you are trying to solve.
2. **Prepare**: Collect and store the data.
3. **Process**: Clean the data (remove duplicates, fix missing values).
4. **Analyze**: Find patterns, relationships, and trends.
5. **Share**: Create visualizations and share insights with stakeholders.
            """,
          ),
        ],

        // 3. QUIZZES
        quizzes: [
          QuizLesson(
            title: "Data Science Basics",
            questions: [
              Question(
                questionText: "Which library is primarily used for data manipulation?",
                options: ["NumPy", "Pandas", "Matplotlib"],
                correctAnswerIndex: 1,
              ),
              Question(
                questionText: "What is a DataFrame?",
                options: ["A list of numbers", "A 2D labeled data structure", "A type of chart"],
                correctAnswerIndex: 1,
              ),
            ],
          ),
        ],
      ),

      // PROGRAM 4: CYBERSECURITY & ETHICAL HACKING
      Program(
        id: 'p4',
        title: 'Cybersecurity & Hacking',
        description: 'Understand network security, penetration testing, and how to protect systems from cyber attacks.',
        difficulty: 'Intermediate',
        duration: '10 Weeks',

        // 1. VIDEOS
        videos: [
          VideoLesson(
              title: "Ethical Hacking Course",
              videoUrl: "https://www.youtube.com/watch?v=fNz8fyh-ie8",
              duration: "15:00:00"
          ),
          VideoLesson(
              title: "Cyber Security in 7 Minutes",
              videoUrl: "https://www.youtube.com/watch?v=inWWhr5tnEA",
              duration: "07:00"
          ),
        ],

        // 2. NOTES
        notes: [
          NoteLesson(
            title: "1. The CIA Triad",
            content: """
# Core Principles of Security
The CIA Triad is a model designed to guide policies for information security.

## 1. Confidentiality
Ensuring that sensitive information is accessed only by an authorized person.
- Example: Using passwords and encryption to protect user data.

## 2. Integrity
Ensuring that data is accurate and trustworthy. It should not be altered by unauthorized people.
- Example: Using file permissions so users can't delete system files.

## 3. Availability
Ensuring that information and resources are available to those who need them.
- Example: Protecting servers from DDoS attacks so the website stays online.
            """,
          ),
          NoteLesson(
            title: "2. Common Cyber Attacks",
            content: """
# Types of Attacks

## 1. Phishing
Attacking the human element. Attackers send fraudulent emails claiming to be from reputable companies to induce individuals to reveal personal information.

## 2. SQL Injection (SQLi)
Attackers interfere with the queries an application makes to its database, allowing them to view data they are not normally able to retrieve.

## 3. Malware
Malicious software designed to cause damage to a computer, server, client, or computer network (e.g., Viruses, Ransomware, Spyware).
            """,
          ),
        ],

        // 3. QUIZZES
        quizzes: [
          QuizLesson(
            title: "Security Fundamentals",
            questions: [
              Question(
                questionText: "What does the 'C' in CIA Triad stand for?",
                options: ["Control", "Confidentiality", "Computer"],
                correctAnswerIndex: 1,
              ),
              Question(
                questionText: "Which attack involves sending fake emails?",
                options: ["DDoS", "Phishing", "SQL Injection"],
                correctAnswerIndex: 1,
              ),
            ],
          ),
        ],
      ),
    ];
  }
}