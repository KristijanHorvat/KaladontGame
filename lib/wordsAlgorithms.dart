import 'dart:convert';
//import 'dart:js_util';
import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;


class Rijec {
  int n = 0;
  Uint8List s = Uint8List(50);
  String str = "";

  @override
  String toString() {
    print("n: " + n.toString() + " s: " + s.toString() + " str: " + str);
    return super.toString();
  }

  int Usporedi(Rijec rijec1, Rijec rijec2) {
    int i, mn, slicnost = 0;
    if (rijec1.n == rijec2.n) {
      for (i = 0; i < rijec1.n; i++) {
        if (rijec1.s[i] == rijec2.s[i]) slicnost++;
        if (rijec1.s[i] < rijec2.s[i]) return -1;
        if (rijec1.s[i] > rijec2.s[i]) return 1;
      }
      return 0;
    } else {
      if (rijec1.n < rijec2.n)
        mn = rijec1.n;
      else
        mn = rijec2.n;
      for (i = 0; i < mn; i++) {
        if (rijec1.s[i] == rijec2.s[i]) slicnost++;
        if (rijec1.s[i] < rijec2.s[i]) return -1;
        if (rijec1.s[i] > rijec2.s[i]) return 1;
      }
      if (slicnost == rijec1.n)
        return -1;
      else
        return 1;
    }
  }
}

List<Rijec> rj = [];

Rijec NapraviRijec(String str) {
  int k = 0, josk = 0, n = 0;
  Rijec rijec = Rijec();
  for (int i = 0; i < str.length; i++) {
    josk = 0;
    if (str[k] == "\n") break;
    if (str[k] == 0) break;
    if (str[k] == 'a') rijec.s[n] = 0;
    if (str[k] == 'b') rijec.s[n] = 1;
    if (str[k] == 'c') rijec.s[n] = 2;
    if (str[k] == 'č') rijec.s[n] = 3; //0xe8
    if (str[k] == 'ć') rijec.s[n] = 4; //0xe6
    if (str[k] == 'd' && str[k + 1] != 'ž') rijec.s[n] = 5; //0x9e
    if (str[k] == 'd' && str[k + 1] == 'ž') {
      rijec.s[n] = 6;
      josk = 1;
    } //0x9e
    if (str[k] == 'đ') rijec.s[n] = 7;
    if (str[k] == 'e') rijec.s[n] = 8;
    if (str[k] == 'f') rijec.s[n] = 9;
    if (str[k] == 'g') rijec.s[n] = 10;
    if (str[k] == 'h') rijec.s[n] = 11;
    if (str[k] == 'i') rijec.s[n] = 12;
    if (str[k] == 'j') rijec.s[n] = 13;
    if (str[k] == 'k') rijec.s[n] = 14;
    if (str[k] == 'l' && str[k + 1] != 'j') rijec.s[n] = 15;
    if (str[k] == 'l' && str[k + 1] == 'j') {
      rijec.s[n] = 16;
      josk = 1;
    }
    if (str[k] == 'm') rijec.s[n] = 17;
    if (str[k] == 'n' && str[k + 1] != 'j') rijec.s[n] = 18;
    if (str[k] == 'n' && str[k + 1] == 'j') {
      rijec.s[n] = 19;
      josk = 1;
    }
    if (str[k] == 'o') rijec.s[n] = 20;
    if (str[k] == 'p') rijec.s[n] = 21;
    if (str[k] == 'r') rijec.s[n] = 22;
    if (str[k] == 's') rijec.s[n] = 23;
    if (str[k] == 'š') rijec.s[n] = 24; //0x9a
    if (str[k] == 't') rijec.s[n] = 25;
    if (str[k] == 'u') rijec.s[n] = 26;
    if (str[k] == 'v') rijec.s[n] = 27;
    if (str[k] == 'z') rijec.s[n] = 28;
    if (str[k] == 'ž') rijec.s[n] = 29; //0x9e
    n++;
    k++;
    if (josk == 1) k++;
  }
  rijec.n = n;
  rijec.str = str;
  //print(rijec.toString());
  return rijec;
}

int TestirajRijec(String rijec) {
  int dg, gg;
  double s;
  int k;
  Rijec q = Rijec();
  q = NapraviRijec(rijec + "\n");
  //print(q.toString());
  dg = 0;
  gg = rj.length - 1;
  for (;;) {
    s = (dg + gg) / 2;
    //buf = Q2str( &rj[s] );
    //print(s.round());
    if (dg > gg) return 1;
    k = rj[s.round()].Usporedi(rj[s.round()], q);
    if (k == 0) return 0;
    if (k == -1) dg = s.round() + 1;
    if (k == 1) gg = s.round() - 1;
  }
  return 0;
}

String NazadUString(Rijec rijec) {
  List buf = [];
  int i, k = 0, qsl;
  for (i = 0; i < rijec.n; i++) {
    qsl = rijec.s[i];
    if (qsl == 0) buf.add('a');
    if (qsl == 1) buf.add('b');
    if (qsl == 2) buf.add('c');
    if (qsl == 3) buf.add('č');
    if (qsl == 4) buf.add('ć');
    if (qsl == 5) buf.add('d');
    if (qsl == 6) {
      buf.add('d');
      buf.add('ž');
    }
    if (qsl == 7) buf.add('đ');
    if (qsl == 8) buf.add('e');
    if (qsl == 9) buf.add('f');
    if (qsl == 10) buf.add('g');
    if (qsl == 11) buf.add('h');
    if (qsl == 12) buf.add('i');
    if (qsl == 13) buf.add('j');
    if (qsl == 14) buf.add('k');
    if (qsl == 15) buf.add('l');
    if (qsl == 16) {
      buf.add('l');
      buf.add('j');
    }
    if (qsl == 17) buf.add('m');
    if (qsl == 18) buf.add('n');
    if (qsl == 19) {
      buf.add('n');
      buf.add('j');
    }
    if (qsl == 20) buf.add('o');
    if (qsl == 21) buf.add('p');
    if (qsl == 22) buf.add('r');
    if (qsl == 23) buf.add('s');
    if (qsl == 24) buf.add('š');
    if (qsl == 25) buf.add('t');
    if (qsl == 26) buf.add('u');
    if (qsl == 27) buf.add('v');
    if (qsl == 28) buf.add('z');
    if (qsl == 29) buf.add('ž');
  }
  //buf[k] = 0;
  return buf.join();
}

Future<void> ucitaj(List<String> list) async {
  //print('Hello world: ${dart_application_1.calculate()}!');
  //final directory = await getApplicationDocumentsDirectory();
  //int n = 0;
  //var path = rootBundle;
  // List<String> a = loadAsset().whenComplete(() => utf8.decoder).asStream();
  //debugPrint(path.);
  //List<String> list = [];
  //await new File(path)
    //  .openRead()
    //  .transform(utf8.decoder)
    //  .transform(LineSplitter())
    //  .forEach((l) {
   // list.add(l);
    //print(list.toList().toString());
  //});
  //print(list.toList().toString());
  //print("a" + NapraviRijec("džep\n").toString());
  list.forEach((element) {
    Rijec rijec = Rijec();
    rijec = NapraviRijec(element + "\n");
    rj.add(rijec);
  });
  //debugPrint("ovo je peti element" + rj[5].toString());
  //print("asd" + rj[0].toString());
  /* rj.forEach((element) {
    print(element.toString());
  });
  print(NazadUString(rj[50]));
  if (TestirajRijec("džem\n") == 0)
    print("postoji");
  else
    print("ne postoji");
    */
}

//Future<ByteData> loadAsset() async {
 // return await rootBundle.load('assets/my_text.txt');
//}
