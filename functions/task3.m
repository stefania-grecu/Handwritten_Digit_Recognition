## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} pca_cov (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-09-06

function new_X = task3 (photo, pcs)
  [m, n] = size (photo);

  % initializare matrice finala.
  new_X = zeros (m, n);

  % TODO: cast photo la double.
  A = double(photo);

  % TODO: calculeaza media fiecarui rand al matricii.
  Q = zeros(m, 1);
  for i=1:m
    Q(i,1) = norm(A(i,:),1) / n;
  endfor

  % TODO: normalizeaza matricea initiala scazand din ea media fiecarui rand.
  A(1:m,:) = A(1:m,:) - Q(1:m);

  % TODO: calculeaza matricea de covarianta.
  Z = (A*A') / (n - 1);

  % TODO: calculeaza vectorii si valorile proprii ale matricei de covarianta.
  % HINT: functia eig
  [V S] = eig(Z);

  % TODO: ordoneaza descrescator valorile proprii si creaza o matrice V
  % formata din vectorii proprii asezati pe coloane, astfel incat prima coloana
  % sa fie vectorul propriu corespunzator celei mai mari valori proprii si
  % asa mai departe.

  %iau in B valorile diagonalei matricei S
  B = diag(S);
  %k = dimensiunea lui B
  k = size(B, 1);
  %sortez vectorul B
  B = sort(B);
  %v o sa aiba valorile matricei V
  v = V;

  %parcurg S in sens invers si dupa matricea B si cand gasesc valori egale pun
  %in matricea V coloana din v a carei valoare proprie din S este egala cu
  %valoarea din S
  for i = k:-1:1
    for j = 1:k
      if B(i) == S(j,j)
        V(:,k + 1 - i) = v(:,j);
      endif
    endfor
  endfor

  % TODO: pastreaza doar primele pcs coloane
  % OBS: primele coloane din V reprezinta componentele principale si
  % pastrandu-le doar pe cele mai importante obtinem astfel o compresie buna
  % a datelor. Cu cat crestem numarul de componente principale claritatea
  % imaginii creste, dar de la un numar incolo diferenta nu poate fi sesizata
  % de ochiul uman asa ca pot fi eliminate.
  W = V(:, 1:pcs);

  % TODO: creaza matricea Y schimband baza matricii initiale.
  Y = W' * A;

  % TODO: calculeaza matricea new_X care este o aproximatie a matricii initiale
  new_X = W * Y;

  % TODO: aduna media randurilor scazuta anterior.
  new_X = new_X + Q;

  % TODO: transforma matricea in uint8 pentru a fi o imagine valida.
  new_X = uint8(new_X);
endfunction
