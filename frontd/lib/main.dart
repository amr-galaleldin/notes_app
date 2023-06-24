import 'package:flower_app/ui/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/repositry/repo.dart';
import 'logic/cubit/note_cubit.dart';



SharedPreferences? sharedpref;
void main() async{
  runApp(const MyApp());
   sharedpref= await SharedPreferences.getInstance();
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => Repo(),
      child: BlocProvider(
        create: (context) => NoteCubit(context.read<Repo>()),
        child: const MaterialApp(
          home: Home(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:refresh_loadmore/refresh_loadmore.dart';

// void main() {
//   runApp( MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  /// is the last page | 是否为最后一页
//   bool isLastPage = false;

//   List? list;
//   int page = 1;

//   @override
//   void initState() {
//     super.initState();
//     loadFirstData();
//   }

//   Future<void> loadFirstData() async {
//     await Future.delayed(Duration(seconds: 1), () {
//       setState(() {
//         list = [
//           'dddd',
//           'sdfasfa',
//           'sdfgaf',
//           'adsgafg',
//           'dddd',
//           'sdfasfa',
//           'sdfgaf',
//           'adsgafg',
//           'dddd',
//           'sdfasfa',
//           'sdfgaf',
//           'adsgafg'
//               'adsgafg',
//           'dddd',
//           'sdfasfa',
//           'sdfgaf',
//           'adsgafg'
//         ];
//         isLastPage = false;
//         page = 1;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: list != null
//           ? RefreshLoadmore(
//               onRefresh: loadFirstData,
//               onLoadmore: () async {
//                 await Future.delayed(Duration(seconds: 1), () {
//                   setState(() {
//                     list!.addAll(['123', '234', '457']);
//                     page++;
//                   });
//                   print(page);
//                   if (page >= 3) {
//                     setState(() {
//                       isLastPage = true;
//                     });
//                   }
//                 });
//               },
//               noMoreWidget: Text(
//                 'No more data, you are at the end',
//                 style: TextStyle(
//                   fontSize: 18,
//                   color: Theme.of(context).disabledColor,
//                 ),
//               ),
//               isLastPage: isLastPage,
//               child: list!.isNotEmpty
//                   ? Column(
//                       children: list!
//                           .map(
//                             (e) => ListTile(
//                               title: Text(e),
//                               trailing: Icon(Icons.accessibility_new),
//                             ),
//                           )
//                           .toList(),
//                     )
//                   : Center(
//                       child: Text('empty'),
//                     ),
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }