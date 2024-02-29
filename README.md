# Handwritten_digit_recognition
## TASK 1
Am initializat matricea finala, am facut cast la double pentru imaginea primita ca parametru si am aplicat
algoritmul SVD pentru matricea obtinuta la pasul anterior. Dupa care am redus cele 3 matrici returnate
de functia svd si am calculat aproximarea matricei initiale. La final i-am facut cast in uint8 pentru a fi o
matrice valida.
## TASK 2
Am initializat aproximatioa matricei, i-am facut cast la double imaginei si pe urma am calculat media
fiecarei linie din matricea transformata anterior, valori pe care le-am scazut din liniile ei. Am calculat
matricea Z conform formulei si i-am aplicat functia SVD pentru a afla cele 3 matrici. In matricea W se
retin primele pcs coloane si cu ajutorul acesteia am calculat proiectia lui A in spatiul componentelor
principale. Aproximatia matricei initiale se calculeaza conform formulei din cerinta: WY + miu
## TASK 3
Inceputul este identic cu cel de la taskul 2 insa acum in Z se retine matricea de covarianta, pe care se
aplica functia eig pentru a afla vectorii si valorile proprii a acvesteai. In B retinem valorile proprii pe care
le ordonam crescator si in v vectorii proprii adica V. Parcurgem in senm invers matricea B si in senm
direct matricea S si cand gasim valori egale (B(i) == S (j, j) ) punem in matricea V linia v(j). In W o sa fie
primele pcs coloane din V cu ajutorul careia se calculeaza proiectia lui A si aproximatia matricei initiale.
Lafinal se transforma matricea intr-o imagine valida.
In legatura cu imaginile, cu cat k era mai mare cu atat imaginea deveneam mai clara.
## TASK 4
- prepare_data -- Initializam cele 2 matrici ce trebuie returnate, incarcam datele din tabelul primit
ca argument si punem in matricea train_mat primele no_train_images linii din X si in train_val
primele no_train_imagies valori din y.
- visualise_image -- Initializam matricea im, retinem in a linia "number"din matricea de
antrenament si transformam a intr-o matrice de 28x28. La final o transformam intr-o imaginbe
valida.
- magic_with_pca -- Initializam cele 4 matrici returnate, calculam media fiecarei coloane din
matricea de antrenament, vector pe care il scadem din aceasi matrice (matricea de
antrenament). Calculam matricea de covarianta si vectorii si valorile proprii pentru aceasta, apoi
procedam ca la TAKUL 3 pentru a ordona crescator valorile proprii. Pastram doar primele pcs
valori din V pentru a calcula proiectia lui X. La final se calculeaza aproximatia matricei initiale
conform formulei.
- prepare_photo -- Primeste ca parametru o imagine de test si ii transforma pixelii din 0 in 255 si
din 255 in 0 folosintd functia bitxor. Transpunem im aginea si o trasformam intr-un sir/ vector
linie.
- KNN -- Am initializat vectorul de distante, dupa care am calculat distanta euclidiana pentru
fiecare rand folosind norma de 2, am sortat crescator distantele, retinand in aux pozitia fiecarui
element inainte de sortare. Am retinut labels-urile de pe primele k pozitii din aux si am aplicat
mediana valorilor vectorului v.
- classifyImage -- Am facut cast la double lui im, dupa care am aplicat functia magic_with_pca pe
matricea train_mat si pcs, am aranjat im ca pe un vector linie si dupa am scazut din el miu.
Pentru x am schimbat baza, inmultindu-l cu Vk si dupa am calculat predictia cu functia KNN.
