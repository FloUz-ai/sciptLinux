#!/bin/bash

#Creation de la liste dans la variable image

image=`ls *.jpg *jpeg *png 2>/dev/null`

#Creation du dossier miniature si inexistant

if [ ! -e miniature ]
then
	mkdir miniature
fi

#Creation du debut du code HTML

echo "<!DOCTYPE html>
<html>
	<head>
		<meta charset = \"utf-8\" />
		<link rel=\"stylesheet\" href=\"galerie.css\"/>
		<title>Convertisseur image miniature</title>
	</head>
	<body>
		<header>
			<h1>Generateur de galerie d'image</h1>
			<h2>Je suis un script VIM. Je recupere les images du dossier dans lequel tu  
			te trouve,cree des miniatures, et je les affiche sur cette page !!</h2>
		</header>

		<section> 
	"	>galerie.html

#Implementation des images dans le code HTML

for i in $image
do

	convert -thumbnail 100x100 $i $i.min 
	 mv $i.min miniature 
	echo "<div><p>Image:$i</p>
	<p><a href=\"$i\"><img src=\"miniature/$i.min\" alt=\"imagetest\" /></a></p></div>">>galerie.html

done

#Fin du code HTML

echo -e "</section>\n</body>\n</html>">>galerie.html

#Creation du code CSS

echo "
body
{
	width:800px;
	margin:auto;
	text-align:center;
	background-color: beige;
}

section
{
	display: flex;
	flex-direction:row;
	justify-content:space-around;
	flex-wrap:wrap;
	align-content:space-between;
		

}

div
{
	flex-direction: column;
	border: 2px black solid;
	margin: 5px 5px;
	overflow: hidden;
	width:10em;

}

h1
{
	text-transfom:uppercase;
}

h2
{
	font-style: italic;
	font-size:medium;
}
	
header
{
	height: 200px;	

}

">galerie.css
