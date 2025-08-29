# README

Application Rails générée avec [noesya/rails-templates](https://github.com/noesya/rails-templates), créé par l'équipe [noesya](https://www.noesya.coop).

## Front

### Gestion des icônes

Les icônes sont générées dans une police à partir de fichiers svg via le site [https://icomoon.io/app/#/select](icomoon.io).
Le fichier source des icônes de l'Observatoire est `app/assets/fonts/icomoon.svg`.

Pour ajouter ou enlever une icône de la police générée :
* il vous faut une icôn au format svg ;
* d'abord, charger sur icomoon le fichier source icomoon.svg, ce qui créé un "set" d'icônes avec celles actuelles ;
* à droite du titre du set, un menu burger permet de cliquer sur "import to set" ;
* une fois votre set complet, dans le menu burger, cliquer sur "select all" ;
* en bas de la fenêtre, à droite, le bouton "Generate Font" permet d'accéder à la liste des icônes et de leur code ;
* en bas à droite, cliquer sur "download".

Dans le dossier générer, ne prendre que les fichiers de font contenus dans le dossier `fonts` (formats .eot, .svg, .ttf et .woff) pour les remplacés dans le dossier `app/assets/fonts`.

Une fois les fichiers icomoon remplacés dans l'app, il faut ajouter les icônes à la configuration css : 
* Ouvrir `app/assets/stylesheets/application/variables.sass` ;
* En bas du fichier, ajouter une ligne, par exemple : `$icons: map-merge($icons, ("email": "\e906"))`.
