import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';


final ThemeData theme = ThemeData(
  primaryColor:
      Color(0xffb1b6b6), //ANTIGO primaryColor: Color(0xff075e54), AppBar
);
void main() {
  runApp(MaterialApp(
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(
              0xff8e9090), //ANTIGO accentColor: Color(0xff25d366), linha ao redor de text field
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextToSpeech txtfalar = TextToSpeech();
  TextEditingController txtfala = TextEditingController(text: "Olá, meu nome é Járvis. Como posso ser útil para o Senhor?");

  _falar (){
    String language = 'pt-BR';
    txtfalar.setLanguage(language);
    setState(() {
      txtfalar.speak(txtfala.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converta seu texto em fala!",
        style:  TextStyle(color:  Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(32, 50, 32, 32),
              child: TextField(
                controller: txtfala,
                autofocus: true,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  _falar();
                },
                child: Text(
                  "Converter",
                  style: TextStyle(fontSize: 20, color:  Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  onPrimary: Colors.black,
                  padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
