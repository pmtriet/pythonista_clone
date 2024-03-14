// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// String codeContent = "";
// String final_response = "";

// class CompilePython extends StatefulWidget {
//   const CompilePython({super.key});

//   @override
//   State<CompilePython> createState() => _CompilePythonState();
// }

// class _CompilePythonState extends State<CompilePython> {

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: MainCompilePython(),
//       home: Scaffold(
//       appBar: AppBar(
//         title: const Text('Compile'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.play_arrow,
//               color: Colors.black,
//             ),
//             onPressed: () async{
//               // do something
//               var url = Uri.parse('https://pythoncompiler.herokuapp.com/compile');
//               var response = await http.post(url, body: json.encode({'code': codeContent}));
//               var data = jsonDecode(response.body);
//               setState(() {
//                 final_response = data['output'];
//               });

//             },
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.toll_outlined,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               // do something
//             },
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.add,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               // do something
//             },
//           )
//         ],
//       ),
//       body: MainCompilePython(),

//     ),
//     );
//   }
// }

// class MainCompilePython extends StatefulWidget {
//   const MainCompilePython({super.key});

//   @override
//   State<MainCompilePython> createState() => _MainCompilePythonState();
// }

// class _MainCompilePythonState extends State<MainCompilePython> {
//   final TextEditingController _inputController = TextEditingController();
//   String _result = '';

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           flex: 2,
//           child: Container(
//             color: Colors.grey[300],
//             child: TextField(
//               controller: _inputController,
//               decoration: const InputDecoration(
//               hintText: 'Nhập từ bàn phím...',
//               contentPadding: EdgeInsets.all(16.0),
//               hintMaxLines: 10,
//               ),
//               onChanged: (value) {
//                 // Cập nhật kết quả khi có sự thay đổi trong TextField
//                 setState(() {
//                   // _result = value;
//                   codeContent = value;
//                 });
//               },
//             ),
//           ),
//         ),
//         Expanded(
//           flex: 1,
//           child: Container(
//             color: Colors.grey[200],
//             child: Center(
//               child: Text(
//                 final_response,
//                 style: const TextStyle(fontSize: 24),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );

//   }

//   @override
//   void dispose() {
//     _inputController.dispose();
//     super.dispose();
//   }

//   // void _compilePython() async {
//   //   var url = Uri.parse('https://pythoncompiler.herokuapp.com/compile');
//   //   var response = await http.post(url, body: {'code': _inputController.text});
//   //   var data = jsonDecode(response.body);
//   //   setState(() {
//   //     _result = data['output'];
//   //   });
//   // }

// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CompilePython extends StatelessWidget {
  const CompilePython({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainCompilePython(),
    );
  }
}

class MainCompilePython extends StatefulWidget {
  const MainCompilePython({super.key});

  @override
  _MainCompilePython createState() => _MainCompilePython();
}

class _MainCompilePython extends State<MainCompilePython> {
  final TextEditingController _inputController = TextEditingController();
  String _output = '';
  String _error = '';

  Future<void> _compileCode(String code) async {
    final url = Uri.parse('http://127.0.0.1:5000/compile');

    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body:
          // utf8.encode(jsonEncode(
          //   <String, String>{'code': code},
          // ),
          jsonEncode(
        <String, String>{'code': code},
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      setState(() {
        _output = data['output'];
        _error = data['error'];
      });
    } else {
      setState(() {
        _output = '';
        _error = 'Failed to compile code';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Python Compiler'),
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     // FocusScope.of(context).unfocus();
        //     TextEditingController().clear();
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _inputController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  hintText: 'Nhập mã Python',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _compileCode(_inputController.text);
            },
            child: const Text('Biên dịch'),
          ),
          const SizedBox(height: 20),
          const Text('Output:'),
          Text(_output),
          const SizedBox(height: 20),
          const Text('Error:'),
          Text(_error),
        ],
      ),
    );
  }
}
