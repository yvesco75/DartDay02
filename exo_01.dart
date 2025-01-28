

// 🔍 Protocole Alpha 
void main() {
  String lettre = '''Cher agent X,



J'ai aperçu le chat noir    au point de rendez-vous 7. L'agent Johnson était 

également présent.    Le code secret 42 a été activé.



Notre agent de liaison vous contactera à 23h.



    Cordialement''';

  protocoleAlpha(lettre);
  protocoleBeta(lettre);

}
  
  void protocoleAlpha (String lettre) {
  print(lettre);  // afficher la lettre
  print(lettre.length);  // afficher la longueur de la lettre
  print(lettre. split(" ")); // afficher la séparation de la lettre 

  }
  
// 🔄 Protocole Beta 

    void protocoleBeta (String lettre) {
print(lettre.split('').reversed.join()); // afficher la séparation de la lettre dans l'autre sens

  print(lettre.replaceAll("agent", "espion")); // afficher la séparation de la lettre avec agent remplacer par espion

    }