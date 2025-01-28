


//  le main
void main() {
  String lettre = '''Cher agent X,



J'ai aperçu le chat noir    au point de rendez-vous 7. L'agent Johnson était 

également présent.    Le code secret 42 a été activé.



Notre agent de liaison vous contactera à 23h.



    Cordialement''';

  protocoleAlpha(lettre);
  protocoleBeta(lettre);
  protocoleGamma (lettre);

}


//  🔍 Protocole Alpha
  void protocoleAlpha (String lettre) {
  print(lettre);  // afficher la lettre
  print("la taille de la lettre est : ");
  print( lettre.length);  // afficher la longueur de la lettre
  print(lettre. split(" ")); // afficher la séparation de la lettre 

  }
  
// 🔄 Protocole Beta 

    void protocoleBeta (String lettre) {
print(lettre.split('').reversed.join()); // afficher la séparation de la lettre dans l'autre sens

  print(lettre.replaceAll("agent", "espion")); // afficher la séparation de la lettre avec agent remplacer par espion

    }


   // 📝 Protocole Gamma :

void protocoleGamma (lettre) {
  
  bool debuteParCher = lettre.startsWith("Cher");
  bool termineParCordialement = lettre.endsWith("Cordialement");
  String espaceMultiple = lettre.replaceAll(RegExp(r'\s+'), " ");
  String sansEspace = lettre.trim();
  if (debuteParCher && termineParCordialement) {
    print ("La lettre commence bien par 'Cher' et se termine par 'Cordialement' ");
  }else{
    print(" C'est le mauvais texte");
  }

  print("la lettre sans les espaces à l'intérieur est: $espaceMultiple"); // Supprimer les espace multiples
  print("la lettre sans les espaces du début et la fin est: $sansEspace"); // Supprimer les espace du début et de la fin de la lettre

}
