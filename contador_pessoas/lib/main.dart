import 'package:flutter/material.dart';
//Flutter Launcher Icons
//https://pub.dev/packages/flutter_launcher_icons
//Acessar o HEADME.

//Create an upload keystore
//Para a PlayStore aceitar o app ele deve ter
//uma assinatura criptografada
//em hipotese alguma vc poderá esquecer a senha
//colocada na hora de criar a chave de assinatura
//se isso acontecer esqueca vc nao poderá mais atualizar o app.
//terá que lançar um novo app.


//Adding a launcher icon
//https://docs.flutter.dev/deployment/android

//Flutter's build modes
//Compilação do projeto android
//A versão a ser lançada no PlayStore é a versão release.
//A versão Release é a mais otimizada e
//pequeno no seu tamanho apos a compilação.
//A versao Debug é a versao mais pesada no seu tamanho e compilação.
//https://docs.flutter.dev/testing/build-modes

//Para compilarmos o apk basta digitar o comando abaixo:
//bash$ flutter build apk

//Dentro da pasta do projeto estara a versao
//release no seguinte caminho abaixo:
//contador_pessoas/build/app/outputs/apk/release/app-release.apk

//Para enviar o aplicativo para a Loja PlayStore
//devemos criar um arquivo com o comando abaixo:
//bash$ flutter build appbundle

//O arquivo estara no seguinte caminho abaixo:
//contador_pessoas/build/app/outputs/bundle/release/app-release.abb

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //O const otimiza o código no tempo de compilação.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Tirando a faixa de debug do aplicativo.
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ); //MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  //métodos get para verificar
  //se o local esta lotado ou vazio.
  bool get isEmpty => _counter == 0;
  bool get isFull => _counter == 10; //Maximo de 10 pessoas.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,

      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/sorvete.jpg'),

            //BoxFit.cover aumenta a imagen até cobrir o espaço
            //da tela do dispositivo sem distorcer a imagen.
            fit: BoxFit.cover,
          ), //DecorationImage
        ), //BoxDecoration

        child: Column(
          //Alinha os Widgets no centro da tela.
          mainAxisAlignment: MainAxisAlignment.center,

          //children significa filhos em ingles.
          //por causa da Row a children nao pode ser const
          children: [
            Text(
              isFull ? 'Lotado!' : 'Pode entrar!',
              style: TextStyle(
                fontSize: 20,
                //Muda a cor do texto para vermelho caso esteja lotado.
                color: isFull ? Colors.red : Colors.black,
              ), //TextStyle
            ), //Text
/*
            //Espaço entre o Widget Text acima e o Text Abaixo
            //com o SizedBox.
            const SizedBox(
              height: 30,
            ),
            
            Text(
              //convertendo a variavel int em String.
              _counter.toString(),

              //Como o Widget TextStyle
              //recebe alteração na cor do seu texto
              //ele não pode mais ser const.
              style: TextStyle(
                fontSize: 40,
                //Muda a cor do texto para vermelho caso esteja lotado.
                color: isFull ? Colors.red : Colors.black,
              ), //TextStyle
            ), //Text
            
            const SizedBox(
              height: 30,
            ),
*/

            //Ao invés de usar o SizedBox(heigth: 30,), 
            //duas vezes podemos usar o Widget
            //Padding para definir um espaçamento 
            //entre o Texto acima e o texto do increment
            Padding(
              //EdgeInsets.all define o espaçamento
              //de todos os lados entre os Widgets.
              padding: const EdgeInsets.all(32),
              child: Text(
                //convertendo a variavel int em String.
                _counter.toString(),

                //Como o Widget TextStyle 
                //recebe alteração na cor do seu texto
                //ele não pode mais ser const.
                style: TextStyle(
                  fontSize: 40,
                  //Muda a cor do texto para vermelho caso esteja lotado.
                  color: isFull ? Colors.red : Colors.black,
                ), //TextStyle
              ), //Text
            ), //Padding

            //A Row não pode ser const
            //como o children da colum era const
            //a Row da erro.
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Botao Entrar
                TextButton(
                  //Se estiver lotado desabilita o botao increment
                  onPressed: isFull ? null : _increment,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    //Se estiver lotado muda a cor do botao desabilitado.
                    backgroundColor: isFull ? Colors.grey.withOpacity(0.3) : Colors.white,

                    //Para um botao nao ficar
                    //maior do que o outro por causa do texto
                    //usaremos o fixedSize ao invés do padding.
                    fixedSize: const Size(100, 100),

                    //fazendo com que o botao fique mais redondo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ), //RoundedRectangleBorder
                  ),

                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ), //TextButton

                //Definindo a distancia entre os dois botoes
                //com o SizedBox definindo o width(largura).
                const SizedBox(width: 40),

                //Botao Sair
                TextButton(
                  //Para nao decrementar se estiver vazio null desabilita botao.
                  onPressed: isEmpty ? null : _decrement,
                  style: TextButton.styleFrom(
                    //Se estiver vazio muda a cor do botao desabilitado.
                    backgroundColor:
                        isEmpty ? Colors.grey.withOpacity(0.3) : Colors.white,

                    //Para um botao nao ficar
                    //maior do que o outro por causa do texto
                    //usaremos o fixedSize ao invés do padding.
                    fixedSize: const Size(100, 100),

                    //fazendo com que o botao fique mais redondo
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ), //RoundedRectangleBorder

                    //Aumentando o espaçamento do botao
                    //ao redor do texto com o padding
                    //padding: const EdgeInsets.all(32),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ), //TextStyle
                  ), //text
                ), //TextButton
              ], //children
            ), //Row
          ], //children
        ), //Column
      ), //Container
    ); //Scaffold
  }
}
