// import 'dart:html';
// import 'dart:ui' as ui;
// import 'package:flutter/material.dart';

// class IFrameTesterApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.light(),
//       home: Scaffold(
//         body: Center(
//           child: Container(
//             width: 800,
//             height: 800,
//             decoration: BoxDecoration(
//               border: Border.all(
//                   color: Theme.of(context).colorScheme.onSurface, width: 1.0),
//             ),
//             child: const IframeView(
//                 source:
//                     "https://api.flutter.dev/flutter/widgets/HtmlElementView-class.html"),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IframeView extends StatefulWidget {
//   final String source;

//   const IframeView({Key? key, required this.source}) : super(key: key);

//   @override
//   _IframeViewState createState() => _IframeViewState();
// }

// class _IframeViewState extends State<IframeView> {
//   // Widget _iframeWidget;
//   final IFrameElement _iframeElement = IFrameElement();

//   @override
//   void initState() {
//     super.initState();
//     _iframeElement.src = widget.source;
//     _iframeElement.style.border = 'none';

//     //ignore: undefined_prefixed_name
//     ui.platformViewRegistry.registerViewFactory(
//       'iframeElement',
//       (int viewId) => _iframeElement,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return HtmlElementView(
//       key: UniqueKey(),
//       viewType: 'iframeElement',
//     );
//   }
// }
