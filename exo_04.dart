// RHYTHMIX - Division Innovation Musicale

// Fonction principale
void main() {
  List<Map<String, dynamic>> playlist = [
    {"titre": "Shape of You", "duree": 3.5},
    {"titre": "Blinding Lights", "duree": 3.2},
    {"titre": "Shape of You", "duree": 3.5}, // Doublon pour test
    {"titre": "Take on Me", "duree": 4.0},
    {"titre": "Love Yourself", "duree": 3.8}
  ];

  // Tests des modes avancés
  gererPlaylist(playlist, "recherche", {"titre": "Shape of You"});
  gererPlaylist(playlist, "lecture", {"position": "première"});
  gererPlaylist(playlist, "shuffle", {});
  gererPlaylist(playlist, "filtre", {"motCle": "love"});
  gererPlaylist(playlist, "nettoyage", {});
  gererPlaylist(playlist, "remix", {});
}

// Fonction pour gérer la playlist
void gererPlaylist(List<Map<String, dynamic>> playlist, String mode, Map<String, dynamic> param) {
  switch (mode) {
    case "recherche":
      // ✅ Mode Recherche : Détection de doublon
      String titreRecherche = param["titre"];
      int occurences = playlist.where((chanson) => chanson["titre"] == titreRecherche).length;
      if (occurences > 0) {
        print("🔎 '$titreRecherche' est présent $occurences fois dans la playlist.");
      } else {
        print("❌ '$titreRecherche' n'est pas dans la playlist.");
      }
      break;

    case "lecture":
      // ✅ Mode Lecture : Accès rapide à la première ou dernière chanson
      if (playlist.isEmpty) {
        print(" La playlist est vide.");
        return;
      }
      if (param["position"] == "première") {
        print("▶️ Lecture : Première chanson - ${playlist.first['titre']} (${playlist.first['duree']} min)");
      } else if (param["position"] == "dernière") {
        print("▶️ Lecture : Dernière chanson - ${playlist.last['titre']} (${playlist.last['duree']} min)");
      } else {
        print("⚠️ Erreur : Position inconnue.");
      }
      break;

    case "shuffle":
      // ✅ Mode Shuffle : Inversion totale de la playlist
      playlist = List.from(playlist.reversed);
      print("🔀 Playlist inversée !");
      break;

    case "filtre":
      // ✅ Mode Filtre : Recherche par mot-clé
      String motCle = param["motCle"].toLowerCase();
      List<Map<String, dynamic>> resultat = playlist
          .where((chanson) => chanson["titre"].toLowerCase().contains(motCle))
          .toList();
      if (resultat.isNotEmpty) {
        print("🔍 Chansons contenant '$motCle' :");
        for (var chanson in resultat) {
          print("- ${chanson['titre']} (${chanson['duree']} min)");
        }
      } else {
        print("❌ Aucun morceau ne contient '$motCle'.");
      }
      break;

    case "nettoyage":
      // ✅ Mode Nettoyage : Suppression automatique des doublons
      Set<String> titresVus = {};
      playlist = playlist.where((chanson) {
        if (titresVus.contains(chanson["titre"])) {
          return false; // Supprime le doublon
        } else {
          titresVus.add(chanson["titre"]);
          return true;
        }
      }).toList();
      print("🧹 Doublons supprimés !");
      break;

    case "remix":
      // ✅ Mode Remix : Simulation de versions longues (durée × 2)
      playlist = playlist.map((chanson) {
        return {"titre": chanson["titre"] + " (Remix)", "duree": chanson["duree"] * 2};
      }).toList();
      print("🎧 Mode Remix activé ! Toutes les durées ont été doublées.");
      break;

    default:
      print("⚠️ Erreur : Mode inconnu.");
  }

  // Affichage de la playlist mise à jour
  printPlaylist(playlist);
}

// Fonction utilitaire pour afficher la playlist
void printPlaylist(List<Map<String, dynamic>> playlist) {
  print("\n🎶 Playlist actuelle :");
  for (var chanson in playlist) {
    print("- ${chanson['titre']} (${chanson['duree']} min)");
  }
  print("\n");
}
