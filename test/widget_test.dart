import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notar_e_anotar_app/pages/register_page.dart';
import 'package:notar_e_anotar_app/pages/weekly_routine_registration.dart';

void main() {
  testWidgets('Creating a new task on WeeklyRoutine',
      (WidgetTester tester) async {
    // Procurando widgets a partir de uma key
    final criar = find.byKey(ValueKey("criarButton"));
    final titulo = find.byKey(ValueKey("tituloButton"));
    final salvar = find.byKey(ValueKey("salvarButton"));

    // Realizando o caminho pela interface
    await tester.pumpWidget(MaterialApp(home: WeeklyRoutineRegistration()));
    await tester.tap(criar);
    await tester.pump(Duration(seconds: 1));
    await tester.enterText(titulo, "Tarefa teste");
    await tester.pump(Duration(seconds: 1));
    await tester.tap(salvar);
    await tester.pump(Duration(seconds: 2));

    // Buscando resultado esperado
    expect(find.text("Tarefa teste"), findsOneWidget);
  });

  testWidgets('Forcing error while registering new user',
      (WidgetTester tester) async {
    // Procurando widgets a partir de uma key
    final nome = find.byKey(ValueKey("nomeField"));
    final sobrenome = find.byKey(ValueKey("sobrenomeField"));
    final dependente = find.byKey(ValueKey("dependenteField"));
    final email = find.byKey(ValueKey("emailField"));
    final senha = find.byKey(ValueKey("senhaField"));
    final finalizar = find.byKey(ValueKey("finalizarButton"));

    // Realizando o caminho pela interface
    await tester.pumpWidget(MaterialApp(home: RegisterPage()));
    await tester.enterText(nome, "Rafael");
    await tester.pump(Duration(seconds: 1));
    await tester.enterText(sobrenome, "Silva");
    await tester.pump(Duration(seconds: 1));
    await tester.enterText(dependente, "Junior");
    await tester.pump(Duration(seconds: 1));
    await tester.enterText(email, "emailSemArroba");
    await tester.pump(Duration(seconds: 1));
    await tester.enterText(senha, "123");
    await tester.pump(Duration(seconds: 1));
    await tester.tap(finalizar);
    await tester.pump(Duration(seconds: 1));

    // Buscando resultado esperado
    expect(find.text("A senha deve ter no mínimo 8 caracteres"), findsWidgets);
    expect(find.text("E-mail está incorreto."), findsWidgets);
  });
}
