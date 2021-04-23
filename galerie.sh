#!/bin/bash

image=`ls *.jpg`

if [ ! -e miniature ]
then
	mkdir miniature
fi

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
			<h2>Je suis un script VIM. Je recupere les images du dossier dans lequel je me 
			me trouve, et je les affiche sur cette page !!</h2>
		</header>

		<section><div> 
	"	>galerie.html


for i in $image
do

	convert -thumbnail 50x50 $i $i.min 
	 mv $i.min miniature 
	echo "<p>Image:$i</br>
	<a href=\"$i\"><img src=\"miniature/$i.min\" alt=\"imagetest\" /></a></p></div>">>galerie.html


done

echo -e "</section>\n</body>\n</html>">>galerie.html


echo "
body
{
	width:800px;
	margin:auto;
	text-align:center;
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
}
	
">galerie.css
