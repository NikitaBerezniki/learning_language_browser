import 'package:html/parser.dart' as parser;
import 'package:http/http.dart';
import 'package:dio/dio.dart';
import 'package:html/dom.dart' as dom;

void walk(dom.Document document, bool Function(dom.Element) elementCallback) {
  var stack = <dom.Element>[];
  stack.addAll(document.children.reversed);
  while (stack.isNotEmpty) {
    var element = stack.removeLast();
    if (!elementCallback(element)) {
      break;
    }
    stack.addAll(element.children.reversed);
  }
}

var elements = <dom.Element>[];
var wantedTags = {'title', 'p', 'img'};
walk(document, (element) {
  if (wantedTags.contains(element.localName)) {
    elements.add(element);
  }
  return true;
});

void main(List<String> args) async {
  String initialUrl = 'https://en.wikipedia.org/wiki/Kraken';
  final dio = Dio();
  final response = await dio.get(initialUrl);
  if (response.statusCode == 200) {
    final data = response.data;
    final parse_data = parser.parse(data);
    int index = 0;
    parse_data.body!
        .getElementsByTagName('section, h1, h2, h3, h4, h5, h6, p, td, pre, li')
        .forEach((element) {
      
      // print(element.text);
      // final hrefs = element
      // .getElementsByTagName('a')
      // .where((e) => e.attributes.containsKey('href'))
      // .map((e) => e.attributes['href'])
      // .toList();
      // print(hrefs);
      // print(element.children);
    });
  }
}
// 