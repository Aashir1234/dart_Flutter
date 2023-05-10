- [connecting android emulator with vs code](#android-emulator-with-vs-code)
- [creating variables in dart](#variables)
- [ flutter stateless widget ](#stl)
- [basic helloworld code](#hello)
- [stateless vs statefull widget](#difference-between-stateless-and-state-full-widget)
- [creating first app](#basic-app)
- [child/children](#child/children)
- [routes](#routes)
- [scaffold_property](#scaffold)
- [conditional statements](#conditional-statements)
## android emulator with vs code
1) To  connect android emulator with vscode first install Android ios emulator extension
2) Go to android/sdk/emullator ,right click and then click open in terminal
3) copy path by command (pwd) 
4) go to settings/Emulator configurations and paste emulator path in (Emulator: Emulator Path Linux) section
5) press ctrl + alt + E then view android emulators then select device you want to boot
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
```
To create your first app , first runapp in main function 
void main(){
runapp(App)
```
## routes
routes are basically sequence of pages of your app it accepts key value pair same as dictonary in py. in key add path of page i.e "/" or "/home" and in value call object of main class of that page as { (context) => classname()}
## scaffold 
scaffold is property/component of widget through which you can easily add header(appbar)/fotter/drawer etc (same like html)
## child/children
child children specifies number of items of section/body/container. for single item we use child and for multiple items we use children
## difference between stateless and state full widget
Stateless widgets are the widgets that don’t change i.e. they are immutable. Its appearance and properties remain unchanged throughout the lifetime of the widget. Stateful Widgets are the ones that change its properties during run-time. They are dynamic i.e., they are mutable and can be drawn multiple times within its lifetime. for statefull widget we have to call "set state( () {} )
## conditional-statements
Condition ? True : False ; </br>
it checks boolian if it is "true" then IDE executes statement after "?" and if boolian is false it executes statement which is after ":"
