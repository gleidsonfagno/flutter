 String classificarIMC(double imc) {
      if (imc < 16.0) {
        return "Magreza grave";
      } else if (imc < 17.0) {
        return "magreza moderada";
      } else if (imc < 18.5) {
        return "magreza leve";
      } else if (imc < 25) {
        return "Saudavel";
      } else if (imc < 30) {
        return "Sobrepeso";
      } else if (imc < 35) {
        return "Obesidade Grau 1";
      } else if (imc < 40) {
        return "Obesidade Grau 2 (severa)";
      } else {
        return "Obesidade Grau 3 (morbida)";
      }
    }