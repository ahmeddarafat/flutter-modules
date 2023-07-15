// ignore_for_file: avoid_print

// ----------------- context ----------------
// ------------------------------------------
// [1] Everything in flutter is a widget
// [2] The app is tree of widget
// [3] To know the location of the widget in widget tree by BuildContext
// [4] Every widget builds context by build method
// [5] Every widget has context which only knows the parent context (the context of the parent widget)
//     and doesn't know the child context (the context of the child widget)
// [6] So, the relationship between buildContext is a bottom-up relationship
// [7] So, the only way to navigate in widget tree is up
// [8] Usage:
//         1. Navigation
//         2. Theme
// ------------------------------------------

// 1. Navigation 

// -Navigator.of(context).pushNamed();

// - This line is used to navigate from page to anothor at widget tree
// - It consists of 3 parts
//        1. Navigator:
//              - It means search for the closest Navigator instance inside the widgets tree
//              - MaterialApp widget has Navigator instance
//              - [Navigator], which is used to manage the app's "stack" of pages.
//        2. of(context):
//              - It means form "of" the context which I pass it to you
//        3. pushNamed:
//              - It means from the context in which the navigator instance was found
//                push the disired new page 

// - So, when you navigate from page to another 
// - The second page won't be child of last widget of first page
// - But it will be child of MaterialApp Widget
// - The children of MaterialApp widget (Pages) are managed in "stack"
//       - push            : It means push
//       - pop             : It means pop
//       - pushReplacement : It means pop then push
//
//        (MaterialApp Widget)
//            /            \
//        (Page 1)         (Page 2)
//         /                  \
//   other widgets           other widgets



