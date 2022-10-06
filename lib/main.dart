import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:pruebawidget/AlertDialog.dart';
import 'package:pruebawidget/HomePage.dart';
import 'package:pruebawidget/HorizontalScroll.dart';
import 'package:pruebawidget/MostrarWidget.dart';
import 'package:pruebawidget/SearchScreen.dart';
import 'package:pruebawidget/StepperScreen.dart';
import 'package:pruebawidget/components/product_card.dart';
import 'package:pruebawidget/details_screen.dart';
import 'package:pruebawidget/home_controller.dart';
import 'package:pruebawidget/models/Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = true;
  final controller = HomeController();
  int curreentste = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabla de datos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AnimatedIconButton(
              size: 40,
              onPressed: () => setState(() => isVisible = !isVisible),
              duration: const Duration(milliseconds: 500),
              splashColor: Colors.transparent,
              icons: const <AnimatedIconItem>[
                AnimatedIconItem(
                  //keyboard_arrow_up_rounded
                  icon: Icon(Icons.keyboard_arrow_up_rounded,
                      color: Colors.purple),
                ),
                AnimatedIconItem(
                  icon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Colors.purple),
                ),
              ],
            ),
            if (isVisible)
              Container(
                // Another fixed-height child.
                color: const Color(0xff008000), // Green
                height: 200.0,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: demo_products.length,
                  itemBuilder: (context, index) => ProductCard(
                    product: demo_products[index],
                    press: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 500),
                          reverseTransitionDuration:
                              const Duration(milliseconds: 500),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  FadeTransition(
                            opacity: animation,
                            child: DetailsScreen(
                              product: demo_products[index],
                              onProductAdd: () {
                                controller
                                    .addProductToCart(demo_products[index]);
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            Text("data"),
            ElevatedButton(
              onPressed: () {
                setState(() => newMethod(context));
              },
              child: Text(""),
            ),
            //newMethod(context)
          ],
        ),
      ),
    );
  }

  AlertDialog newMethod(BuildContext context) {
    return AlertDialog(
      title: Text("Alert!!"),
      actions: <Widget>[
        ElevatedButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // Stepper(
        //   currentStep: curreentste,
        //   steps: [
        //     Step(
        //       title: Text("sa"),
        //       content: Text("as"),
        //     )
        //   ],
        // )
      ],
      content: Container(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: Stepper(
          currentStep: curreentste,
          onStepTapped: (index) {
            setState(() => curreentste = index);
          },
          onStepContinue: () {
            if (curreentste != 2) {
              setState(() => curreentste++);
            }
          },
          steps: [
            Step(
              isActive: curreentste >= 0,
              title: Text("Step1"),
              content: Text("as"),
            ),
            Step(
              isActive: curreentste >= 1,
              title: Text("Step2"),
              content: Text("as"),
            ),
            Step(
              isActive: curreentste >= 2,
              title: Text("Step3"),
              content: Text("as"),
            ),
          ],
        ),
      ),
    );
  }
}
