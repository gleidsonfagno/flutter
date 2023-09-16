// import 'dart:convert';

import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../bin/class/via_cep.dart';
import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MockViaCEP])
void main() {
  test(
      'calcular o desconto do produto com desconto sem porcentgem sem pocentagem',
      () {
    expect(app.calcularDesconto(1000, 150, false), equals(850));
  });

  test(
      'calcular o desconto do produto com desconto sem porcentgem sem pocentagem valor do produto zerado',
      () {
    expect(() => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  test('calcular o desconto do produto sem pocentagem com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });

  test('calcular o desconto do produto com desconto zerado', () {
    expect(() => app.calcularDesconto(1000, 0, true),
        throwsA(TypeMatcher<ArgumentError>()));
  });

  group("calcular o valor do produto com desconto", () {
    var valuesToTest = {
      {"valor": 1000, "desconto": 150, "percentual": false}: 850.0,
      {"valor": 1000, "desconto": 15, "percentual": true}: 985.0,
    };

    valuesToTest.forEach((values, expected) {
      test('Entrada: $values:  Esperado: $expected', () {
        expect(
            app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == "true"),
            equals(expected));
      });
    });
  });

  group("calcular o valor do produto com desconto", () {
    var valuesToTest = {
      {"valor": 0, "desconto": 150, "percentual": false},
      {"valor": 1000, "desconto": 0, "percentual": true},
    };

    // ignore: unused_local_variable
    for (var values in valuesToTest) {}
    ((values, expected) {
      test('Entrada: $values:', () {
        expect(
            () => app.calcularDesconto(
                double.parse(values["valor"].toString()),
                double.parse(values["desconto"].toString()),
                values["percentual"] == "true"),
            throwsA(TypeMatcher<ArgumentError>()));
      });
    });
  });

  test('testar conversao para uppercase', () {
    expect(app.converteTuUpper("dio"), equals("DIO"));
  });

  test("valor maior que 50", () {
    // expect(app.returnaValor(50), greaterThan(49));
    print("volar 50 e maior ou igual a 50");
    expect(app.returnaValor(50), greaterThanOrEqualTo(50));
  });

  test("começa com ", () {
    expect(app.converteTuUpper("dio"), startsWith("D"));
  });

  test("valor maior que 50", () {
    // expect(app.returnaValor(50), greaterThan(49));
    print("volar 50 e maior ou igual a 50");
    expect(app.returnaValor(50), greaterThanOrEqualTo(50));
  });

  test("valor diferente", () {
    // expect(app.returnaValor(50), greaterThan(49));
    print("valor diferente 50");
    expect(app.returnaValor(50), isNot(equals(49)));
  });

  test("Retorna CEP", () async {
    // ViaCEP viacep = ViaCEP();
    MockMockViaCEP mockMockViaCEP = MockMockViaCEP();
    when(mockMockViaCEP.retornarCep("01001000")).thenAnswer((realInvocation) => Future.value(
    {
      "cep": "01001-000",
      "logradouro": "Praça da Sé",
      "complemento": "lado ímpar",
      "bairro": "Sé",
      "localidade": "São Paulo",
      "uf": "SP",
      "ibge": "3550308",
      "gia": "1004",
      "ddd": "11",
      "siafi": "7107"
    }));

    var body = await mockMockViaCEP.retornarCep("01001000");
    expect(body["bairro"], equals("Sé"));
    // expect(body["logradouro:"], equals("Praça da Sé"));
  });
}

class MockViaCEP extends Mock implements ViaCEP {}
