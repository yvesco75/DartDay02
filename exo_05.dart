// 📜 Bureau des Mystères - Carte au Trésor 🏴‍☠️

// Fonction principale
void main() {
  // Initialisation de la carte des indices
  Map<String, Map<String, dynamic>> carteTresor = {};

  // Ajout de lieux avec indices
  enregistrerLieu(carteTresor, "Île Perdue", "Un mystérieux rocher en forme de crâne.", 12.5);
  enregistrerLieu(carteTresor, "Temple Ancien", "Des ruines cachées sous la jungle épaisse.", 8.3);
  enregistrerLieu(carteTresor, "Grotte Sombre", "Un passage étroit menant à une salle secrète.", 5.0);
  enregistrerLieu(carteTresor, "Forêt Maudite", "Un lieu dangereux où des aventuriers ont disparu.", 15.2);

  // Affichage de la carte des indices
  afficherCarte(carteTresor);

  // Analyse des indices
  analyserIndices(carteTresor);
}

// 📍 Protocole : Enregistrement des lieux
void enregistrerLieu(Map<String, Map<String, dynamic>> carte, String nom, String indice, double distance) {
  carte[nom] = {
    "indice": indice,
    "distance": distance
  };
  print("📌 Lieu ajouté : $nom (${distance} km) - Indice : \"$indice\"");
}

// ❌ Protocole : Retirer les lieux
void retirerLieu(Map<String, Map<String, dynamic>> carte, String nom) {
  if (carte.containsKey(nom)) {
    carte.remove(nom);
    print("✅ Lieu retiré : $nom (trésor découvert !)");
  } else {
    print("⚠️ Lieu introuvable : $nom");
  }
}

// ✉️ Protocole : Afficher la carte des indices
//  Fonction pour afficher la carte des indices
void afficherCarte(Map<String, Map<String, dynamic>> carte) {
  print("\ Carte des indices :");
  if (carte.isEmpty) {
    print("📭 Aucun lieu enregistré.");
  } else {
    carte.forEach((nom, details) {
      print("- $nom : ${details['indice']} (Distance : ${details['distance']} km)");
    });
  }
  print("\n");
}

// 🔍 Protocole : Analyse des indices
void analyserIndices(Map<String, Map<String, dynamic>> carte) {
  print("\n🔍 Analyse des indices :");

  // Mots-clés d'alerte
  List<String> motsAlerte = ["danger", "disparu", "interdit", "piège"];

  carte.forEach((nom, details) {
    String indice = details["indice"];
    int longueur = indice.length;

    // Vérification des mots-clés
    List<String> alertes = motsAlerte.where((mot) => indice.toLowerCase().contains(mot)).toList();

    // Affichage des analyses
    print("\n📍 Lieu : $nom");
    print("- Longueur de l'indice : $longueur caractères.");
    if (alertes.isNotEmpty) {
      print("⚠️ Alerte : Cet indice contient des termes dangereux : ${alertes.join(", ")} !");
    } else {
      print("✅ Indice sans danger détecté.");
    }
  });
  print("\n");
}
