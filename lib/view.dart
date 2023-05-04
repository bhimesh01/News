import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// class ArticleView extends StatefulWidget {
//   final String postUrl;
//   final String imgUrl;
//   final String desc;
//   final String title;
//   final String content;
//   ArticleView(
//       {required this.postUrl,
//       required this.imgUrl,
//       required this.desc,
//       required this.title,
//       required this.content});
//   @override
//   _ArticleViewState createState() => _ArticleViewState();
// }

// class _ArticleViewState extends State<ArticleView> {
//   // final Completer<WebViewController> _controller =
//   //     Completer<WebViewController>();
//   //_controller = WebViewController()

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black)),
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               "Bhimesh",
//               style:
//                   TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
//             ),
//             Text(
//               "News",
//               style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
//             )
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           alignment: Alignment.bottomCenter,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(6),
//                   bottomLeft: Radius.circular(6))),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             //mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(6),
//                   child: Image.network(
//                     widget.imgUrl,
//                     height: 200,
//                     width: MediaQuery.of(context).size.width,
//                     fit: BoxFit.cover,
//                   )),
//               SizedBox(
//                 height: 12,
//               ),
//               Text(
//                 widget.title,
//                 maxLines: 2,
//                 style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Text(
//                 widget.desc,
//                 style: TextStyle(color: Colors.black54, fontSize: 14),
//               ),
//               SizedBox(
//                 height: 4,
//               ),
//               Text(
//                 widget.content,
//                 style: TextStyle(color: Colors.black, fontSize: 18),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class view extends StatefulWidget {
  final String postUrl;
  const view({
    super.key,
    required this.postUrl,
  });

  @override
  State<view> createState() => _viewState(Url: postUrl);
}

class _viewState extends State<view> with TickerProviderStateMixin {
  final String Url;
  //final String tempUrl = Url;
  _viewState({required this.Url});
  get controller => WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(Url));

  //static String get postUrl => postUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.black)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bhimesh",
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
