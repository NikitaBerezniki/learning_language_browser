import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Completer<WebViewController> webController = Completer<WebViewController>();
  final Set<String> _favorites = <String>{};
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   actions: <Widget>[
      //     // NavigationControls(_controller.future),
      //     Menu(controller.future, () => _favorites),
      //   ],
      // ),
      body: SafeArea(
        child: WebView(
          initialUrl: 'https://en.wikipedia.org/wiki/Kraken',
          onWebViewCreated: (WebViewController webViewController) {
            webController.complete(webViewController);
          },
        ),
      ),
      floatingActionButton: _showReadableScreen(),
    );
  }

  _showReadableScreen() {
    return FutureBuilder<WebViewController>(
      future: webController.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              String? url = await controller.data?.currentUrl();
            },
            child: Icon(Icons.local_library),
          );
        }
        return Container();
      },
    );
  }
}

// class Menu extends StatelessWidget {
//   const Menu(this._webViewControllerFuture, this.favoritesAccessor, {Key? key})
//       : super(key: key);
//   final Future<WebViewController> _webViewControllerFuture;
//   final Function favoritesAccessor;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _webViewControllerFuture,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> controller) {
//         if (!controller.hasData) return Container();
//         return PopupMenuButton<String>(
//           onSelected: (String value) async {
//             var newUrl = await Navigator.push(context,
//                 MaterialPageRoute(builder: (BuildContext context) {
//               return FavoritesPage(favoritesAccessor());
//             }));
//           },
//           itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
//             const PopupMenuItem<String>(
//               value: 'See Favorites',
//               child: Text('See Favorites'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class FavoritesPage extends StatelessWidget {
//   const FavoritesPage(this.favorites, {Key? key}) : super(key: key);
//   final Set<String> favorites;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Favorite pages')),
//       body: ListView(
//           children: favorites
//               .map((url) => Card(
//                     child: ListTile(
//                         title: Text(url),
//                         onTap: () => Navigator.pop(context, url)),
//                   ))
//               .toList()),
//     );
//   }
// }

// class NavigationControls extends StatelessWidget {
//   const NavigationControls(this._webViewControllerFuture)
//       : assert(_webViewControllerFuture != null);

//   final Future<WebViewController> _webViewControllerFuture;

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<WebViewController>(
//       future: _webViewControllerFuture,
//       builder:
//           (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
//         final bool webViewReady =
//             snapshot.connectionState == ConnectionState.done;
//         final WebViewController controller = snapshot.data as WebViewController; // Поправил
//         return Row(
//           children: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.arrow_back_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () => navigate(context, controller, goBack: true),
//             ),
//             IconButton(
//               icon: const Icon(Icons.arrow_forward_ios),
//               onPressed: !webViewReady
//                   ? null
//                   : () => navigate(context, controller, goBack: false),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   navigate(BuildContext context, WebViewController controller,
//       {bool goBack: false}) async {
//     bool canNavigate =
//         goBack ? await controller.canGoBack() : await controller.canGoForward();
//     if (canNavigate) {
//       goBack ? controller.goBack() : controller.goForward();
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text("No ${goBack ? 'back' : 'forward'} history item")),
//       );
//     }
//   }
// }
