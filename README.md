- [creating variables in dart](#variables)
- [ flutter stateless widget ](#stl)
- [basic helloworld code](#hello)
- [creating first app](#basic-app)
## variables
```
// ways to declare variales in dart 

 int days = 30;
 String name = "aashir";
 double pi = 3.14;
 bool ismale = true;
 var day = "tuesday"; // dynamic data type (var) we can assign it string/num
 const pi = 3.14;   // we can declare constants whose values donot change
 final int days = 30; // we can variable a final variable whose value doesn't change throughout program
```
## stl
write stl and press enter then IDE will generate a stateless widget here replace  widget name with your your app name in both (class and constructor)
### build 
@override 
widget build(BuildContext context){
....
}
This is very important because all UI is written under build 
## hello
```
void main() {        //we have to declare function on starting of dart program
  print('Hello, World!');  //same as python just an addition of semicolon(;)
}
```
## basic app
To create your first app , first runapp in main function 
void main(){
runapp(App
